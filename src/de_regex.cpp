#include <cpp11.hpp>
#include <string>
#include <regex>
using namespace cpp11;

[[cpp11::register]]
cpp11::writable::strings de_regex(strings the_regex){

  // regex for removal
  std::string rm_str;
  rm_str = "(\\(+\\?=[^\\)]+\\)+)";
  rm_str += "|(\\(+\\?\\![^\\)]+\\)+)";
  rm_str += "|(\\(\\?<=[^\\)]+\\))";
  rm_str += "|(\\(\\?<\\![^\\)]+\\))";
  rm_str += "|( [*+])";
  rm_str += "|(\\.)";
  rm_str += "|(\\*)";
  rm_str += "|(\\\\)";
  rm_str += "|(\\+)";
  rm_str += "|(\\^)";
  rm_str += "|(\\|)";
  rm_str += "|(\\$)";
  std::regex rm_regex(rm_str);

  // Declare output string
  writable::strings the_string;

  // Strip out regular expressions from input vector
  for(auto it = the_regex.begin(); it != the_regex.end(); ++it){
    the_string.push_back(std::regex_replace(std::string(*it), rm_regex, ""));
  }

  return the_string;
}

std::string de_regex(std::string the_regex){

  // regex for removal
  std::string rm_str;
  rm_str = "(\\(+\\?=[^\\)]+\\)+)";
  rm_str += "|(\\(+\\?\\![^\\)]+\\)+)";
  rm_str += "|(\\(\\?<=[^\\)]+\\))";
  rm_str += "|(\\(\\?<\\![^\\)]+\\))";
  rm_str += "|( [*+])";
  rm_str += "|(\\.)";
  rm_str += "|(\\*)";
  rm_str += "|(\\\\)";
  rm_str += "|(\\+)";
  rm_str += "|(\\^)";
  rm_str += "|(\\|)";
  rm_str += "|(\\$)";
  std::regex rm_regex(rm_str);

  // Declare output string and strip out regular expressions
  std::string the_string = std::regex_replace(the_regex, rm_regex, "");

  return the_string;
}
