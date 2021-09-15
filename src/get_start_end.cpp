#include <cpp11.hpp>
#include <string>
#include <regex>
using namespace cpp11;

void get_start_end(std::string &header,
                   strings &regex,
                   writable::doubles &start,
                   writable::doubles &end){

  // Iterate over regular expressions provided
  for(auto it=regex.begin(); it!=regex.end(); ++it){
    bool found = true;
    std::regex the_regex = std::regex(std::string(*it));
    size_t pos = 0;
    std::vector<size_t> spos;
    std::vector<size_t> len;
    while(pos < header.length()){
      std::smatch match;
      std::string search_string = header.substr(pos, header.length()-pos);
      if(std::regex_search(search_string, match, the_regex)){
        spos.push_back(match.position() + pos);
        len.push_back(match.length());
        pos += match.position() + match.length();
      }else{
        break;
      }
    }
    if(spos.size() <= 0){
      // No matches found
      start.push_back(R_NaReal);
      end.push_back(R_NaReal);
    }else if(spos.size() == 1){
      // Only one match is found
      // the following assumes one-based indexing
      start.push_back(spos[0] + 1.);
      end.push_back(spos[0] + len[0]);
    }else{
      // If more than one match is found attempt to select correct match:
      // temporary variables
      std::vector<bool> front_check;
      std::vector<bool> back_check;
      int first;
      int l;
      // Check front of match
      for(size_t i = 0; i < spos.size(); ++i){
        // value is false unless conditions are met
        front_check.push_back(false);
        l = 2;
        if(spos[i] - 1 >= 0){
          // match is not at beginning of header
          first = spos[i] - 1;
          if(l > header.length()) l = header.length();
          std::string check_str = header.substr(first, l);
          front_check.back() = check_str[0] == ' ' | check_str[1] == ' ';
        }else{
          // match is at beginning of header
          front_check.back() = true;
        }
      }
      // check back of match
      for(size_t i = 0; i < spos.size(); ++i){
        // value is false unless conditions are met
        back_check.push_back(false);
        l = 2;
        if(spos[i] + len[i] + 1 < header.length()){
          // match is not at end of header
          first = spos[i] + len[i] - 1;
          std::string check_str = header.substr(first, l);
          back_check.back() = check_str[0] == ' ' | check_str[1] == ' ';
        }else{
          // match is at end of header
          back_check.back() = true;
          }
      }
      int front_check_count = 0;
      std::vector<size_t> front_true;
      for(size_t i = 0; i < front_check.size(); ++i){
        if(front_check[i]){
          front_check_count += 1;
          front_true.push_back(i);
        }
      }
      if(front_check_count == 1){
        // the following assumes one-based indexing
        start.push_back(spos[front_true[0]] + 1.);
        end.push_back(spos[front_true[0]]+len[front_true[0]]);
      }else{
        int back_check_count = 0;
        std::vector<size_t> back_true;
        for(size_t i = 0; i < back_check.size(); ++i){
          if(back_check[i]){
            back_check_count += 1;
            back_true.push_back(i);
          }
        }
        if(back_check_count == 1){
          // the following assumes one-based indexing
          start.push_back(spos[back_true[0]] + 1.);
          end.push_back(spos[back_true[0]]+len[back_true[0]]);
        }else{
          int front_back_check_count = 0;
          std::vector<size_t> front_back_true;
          for(size_t i = 0; i < front_check.size(); ++i){
            if(front_check[i] && back_check[i]){
              front_back_check_count += 1;
              front_back_true.push_back(i);
            }
          }
          if(front_back_check_count == 1){
            // the following assumes one-based indexing
            start.push_back(spos[front_back_true[0]] + 1.);
            end.push_back(spos[front_back_true[0]]+len[front_back_true[0]]);
          }else{
            // Unable to determine correct match so return first match
            // the following assumes one-based indexing
            start.push_back(spos[0]+1.);
            end.push_back(spos[0]+len[0]);
          }
        }
      }
    }
  }
}
