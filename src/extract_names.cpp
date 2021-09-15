#include <cpp11.hpp>
#include <string>
#include <regex>
#include <iostream>
using namespace cpp11;

std::string name_to_regex(std::string cname);

void copy_into(strings &names,
               std::string &header,
               std::string &check_str,
               writable::strings &cnames){

  for(auto it = names.begin(); it != names.end(); ++it){
    if((check_str.length() == 0 ||
       !std::regex_match(std::string(*it), std::regex(check_str))) &&
       std::regex_search(header,
                         std::regex(name_to_regex(std::string(*it))))){
      if(check_str.length() > 0){
        check_str += "|(" + name_to_regex(std::string(*it)) + ")";
      }else{
        check_str = "(" + std::string(*it) + ")";
      }
      cnames.push_back(*it);
    }
  }
}

[[cpp11::register]]
cpp11::writable::strings extract_names(std::string header,
                                       strings col_types,
                                       strings ljust,
                                       strings col_names){

  writable::strings cnames;
  std::string check_str;
  std::regex name_regex = std::regex("[^ ]+(?= *$)");
  std::smatch m;

  // copy col_names into cnames
  copy_into(col_names, header, check_str, cnames);

  // copy ljust into cnames
  copy_into(ljust, header, check_str, cnames);

  // copy col_types into cnames
  copy_into(col_types, header, check_str, cnames);

  // Remove known column names from header
  header = std::regex_replace(header, std::regex(check_str), "");

  while(std::regex_search(header, m, name_regex)){
    if(check_str.length() == 0 ||
       !std::regex_match(m.str(), std::regex(check_str))){
      if(check_str.length() > 0){
        check_str += "|(" + std::string(m.str()) + ")";
      }else{
        check_str = "(" + std::string(m.str()) + ")";
      }
      cnames.push_back(m.str());
    }
    header = header.substr(0,m.position());
  }

  return cnames;
}
