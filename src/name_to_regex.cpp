#include <cpp11.hpp>
#include <string>
#include <regex>
#include <iostream>

using namespace cpp11;

[[cpp11::register]]
cpp11::writable::strings name_to_regex(strings cnames){

  writable::strings regex_str;

  for(auto it = cnames.begin(); it != cnames.end(); ++it){
    std::string tmp_str = std::regex_replace(std::string(*it),
                                             std::regex("\\(([^\\?]+)\\)"),
                                             "\\($1\\)");
    tmp_str = std::regex_replace(tmp_str,
                                 std::regex("\\?(?![\\=\\!<])"),
                                 "\\?");
    regex_str.push_back(tmp_str);
  }

  return regex_str;
}

std::string name_to_regex(std::string cname){

  std::string tmp_str = std::regex_replace(cname,
                                           std::regex("\\(([^\\?]+)\\)"),
                                           "\\($1\\)");
  tmp_str = std::regex_replace(tmp_str,
                               std::regex("\\?(?![\\=\\!<])"),
                               "\\?");

  return tmp_str;
}
