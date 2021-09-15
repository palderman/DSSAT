#include <cpp11.hpp>
#include <string>
#include <regex>
using namespace cpp11;

std::string de_regex(std::string the_regex);

cpp11::writable::strings name_to_regex(strings cnames);

[[cpp11::register]]
cpp11::writable::strings gen_regex(strings cnames, strings ljust){

  writable::strings col_names = name_to_regex(cnames);

  // Default regex is simply the original cnames
  writable::strings regex_out = col_names;

  std::string ljust_str;
  std::regex ljust_regex;

  std::string name_search;
  std::regex name_regex;

  // Construct regex for all left justified list
  for(auto it=ljust.begin(); it!=ljust.end(); ++it){
    if(ljust_str.length() > 0){
      ljust_str += "|(" + std::string(*it) + ")";
    }else{
      ljust_str = "(" + std::string(*it) + ")";
    }
  }
  ljust_regex = std::regex(ljust_str);

  for(auto i = 0; i < cnames.size(); ++i){
    if(ljust_str.length() > 0 &&
       std::regex_search(std::string(cnames[i]), ljust_regex)){
      regex_out[i] = std::string(cnames[i]) + " *";
    }else{
      if(name_search.length() < 1){
        // Construct regex for name search list
        for(auto it=col_names.begin(); it!=col_names.end(); ++it){
          if(name_search.length() > 0){
            name_search += "|(" + std::string(r_string(*it)) + ")";
          }else{
            name_search = "(" + std::string(r_string(*it)) + ")";
          }
        }
        name_regex = std::regex(name_search);
      }
      std::string name = de_regex(cnames[i]);
      if(!std::regex_search(name, name_regex)){
        regex_out[i] = " *" + std::string(r_string(col_names[i])) + "((?= )|(?=$))";
      }
    }
  }

  return regex_out;
}
