#include <cpp11.hpp>
using namespace cpp11;

void reconcile_gaps_cpp(strings &cnames,
                        strings &regexpr,
                        writable::strings &col_names,
                        writable::doubles &start,
                        writable::doubles &end,
                        strings left_justified);

[[cpp11::register]]
data_frame header_to_fwf_position_cpp(data_frame start_end,
                                      strings left_justified,
                                      strings read_only) {

  // Declare incoming variables
  strings cnames_in(start_end["cnames"]);
  strings names_in(start_end["col_names"]);
  strings regex_in(start_end["regex"]);
  writable::doubles beg_in(start_end["start"]);
  writable::doubles end_in(start_end["end"]);

  // Declare output variables
  writable::doubles begin;
  writable::doubles end;
  writable::strings col_names;

  // Reconcile gaps/overlaps in column bounds
  reconcile_gaps_cpp(cnames_in, regex_in, col_names, beg_in, end_in, left_justified);

  // Set values for begin, end, and col_names
  for(size_t i = 0; i < beg_in.size(); ++i){
    // Check against read_only
    bool store = read_only.size() <= 0 && names_in[i] != strings({"-99"})[0];
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
        for(auto it = left_justified.begin();
            it != left_justified.end();
            ++it){
          // Set end of last column to NA (i.e. unbounded)
          if(cnames_in[i] == *it){
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
