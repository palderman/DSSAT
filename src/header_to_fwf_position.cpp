#include <cpp11.hpp>
#include <string>
#include <regex>
#include <numeric>
#include <iostream>
using namespace cpp11;

void reconcile_gaps_cpp(writable::strings &cnames,
                        writable::strings &regexpr,
                        writable::strings &col_names,
                        writable::doubles &start,
                        writable::doubles &end,
                        writable::strings &left_justified);

void get_start_end(std::string &header,
                   strings &regex,
                   writable::doubles &start,
                   writable::doubles &end);

cpp11::writable::strings de_regex(strings the_regex);

cpp11::writable::strings gen_regex(strings cnames,
                                   strings ljust);

void arrange_by_start(cpp11::writable::doubles &beg_in,
                      cpp11::writable::doubles &end_in,
                      cpp11::writable::strings &regex_in,
                      cpp11::writable::strings &col_names,
                      cpp11::writable::strings &cnames);

cpp11::writable::strings extract_names(std::string header,
                                       strings col_types,
                                       strings ljust,
                                       strings col_names);

[[cpp11::register]]
data_frame header_to_fwf_position_cpp(std::string header,
                                      strings col_types_names,
                                      strings left_justified,
                                      strings col_names_in,
                                      strings read_only) {
  // Declare incoming variables
  writable::strings cnames_in;
  writable::strings regex_in;
  writable::strings names_in;

  cnames_in = extract_names(header, col_types_names, left_justified,
                            col_names_in);

  regex_in = gen_regex(cnames_in, left_justified);

  names_in = de_regex(cnames_in);

  // Declare temporary variables
  writable::strings ljust;
  writable::doubles beg_in;
  writable::doubles end_in;

  // Declare output variables
  writable::doubles begin;
  writable::doubles end;
  writable::strings cnames;
  writable::strings col_names;

  // Remove leading/trailing spaces from col_names
  for(auto it = names_in.begin(); it != names_in.end(); ++it){
    *it = std::regex_replace(std::string(r_string(*it)),
                             std::regex("(^ *)|( *$)"),
                             "");
  }

  // Extract cnames from header
  for(auto it = regex_in.begin(); it != regex_in.end(); ++it){
    std::regex tmp_regex = std::regex(
      std::regex_replace(std::string(r_string(*it)),
                       std::regex(" [*+]"),
                       "")
    );
    std::smatch match;
    std::regex_search(header, match, tmp_regex);
    cnames.push_back(match.str());
  }

  // Infer column positions from header
  get_start_end(header, regex_in, beg_in, end_in);

  // Arrange by start column
  arrange_by_start(beg_in, end_in, regex_in, names_in, cnames);
  // beg_in, end_in, regex_in, names_in, cnames

  // Set start of first column to 1
  beg_in[0] = 1;

  // Remove extra spaces involved in regular expressions from left_justified
  if(left_justified.size() > 0){
    for(auto it = left_justified.begin(); it != left_justified.end(); ++it){
      std::string check = std::regex_replace(std::string(*it), std::regex("( \\*)|( \\+)"), "");
      std::smatch the_match;
      if(std::regex_search(header, the_match, std::regex(check))) ljust.push_back(the_match.str());
    }
  }

  // Reconcile gaps/overlaps in column bounds
  reconcile_gaps_cpp(cnames, regex_in, names_in, beg_in, end_in, ljust);

  // Set values for begin, end, and col_names
  for(size_t i = 0; i < beg_in.size(); ++i){
    // Check against read_only
    bool store = read_only.size() <= 0 && r_string(names_in[i]) != strings({"-99"})[0];
    if(!store){
      for(auto it = read_only.begin(); it != read_only.end(); ++it){
        store = names_in[i] == *it;
        if(store) break;
      }
    }
    if(store){
      // Set begin indices minus one
      begin.push_back(beg_in[i] - 1.);
      end.push_back(end_in[i]);
      col_names.push_back(names_in[i]);
      if(i == beg_in.size() - 1){
        // Check column positions for left justified cases
        for(auto it = ljust.begin(); it != ljust.end(); ++it){
          // Set end of last column to NA (i.e. unbounded)
          if(cnames[i] == *it){
            end[end.size() - 1] = NA_REAL;
            break;
          }
        }
      }
    }
  }

  // Construct results data.frame
  writable::data_frame results({
    "begin"_nm = begin,
    "end"_nm = end,
    "col_names"_nm = col_names
  });

  // Set results class to tibble
  results.attr("class") = strings({"tbl_df", "tbl", "data.frame"});

  return results;
}
