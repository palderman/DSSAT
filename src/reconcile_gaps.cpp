#include <cpp11.hpp>
#include <iostream>
#include <string>
#include <regex>
#include <testthat.h>
using namespace cpp11;

void reconcile_gaps_cpp(strings &cnames,
                        strings &regexpr,
                        writable::strings &col_names,
                        writable::doubles &start,
                        writable::doubles &end,
                        strings left_justified){

  // Calculate separation between columns, should be 1
  // strings cnames(loc["cnames"]);
  // strings regexpr(loc["regex"]);
  // strings col_names(loc["col_names"]);
  //
  // writable::doubles start(loc["start"]);
  // writable::doubles end(loc["end"]);

  writable::integers has_gaps;
  writable::integers has_overlaps;

  for(size_t i=1; i < start.size(); ++i){
    // Check for gaps between columns
    if(start[i] - end[i-1] > 1.) has_gaps.push_back(i-1);
    // Check for overlaps between columns
    if(start[i] - end[i-1] < 1.) has_overlaps.push_back(i-1);
  }

  // Extend columns to fill in gaps
  for(auto it = has_gaps.begin(); it != has_gaps.end(); ++it){
    bool ljust = false;
    for(auto ljit = left_justified.begin(); ljit != left_justified.end(); ++ljit){
      ljust = cnames[*it] == *ljit;
      if(ljust) break;
    }
    if(ljust){
      bool ljust2 = false;
      for(auto ljit = left_justified.begin(); ljit != left_justified.end(); ++ljit){
        ljust2 = cnames[*it+1] == *ljit;
        if(ljust2) break;
      }
      if(ljust2 ||
         std::regex_search(std::string(regexpr[*it+1]),std::regex("^ *"))){
        // If column i is left justified and start of column i+1
        //   is determined by regex extend end of column i
        end[*it] = start[*it+1] - 1.;
      }else{
        // If column i is left justified and start of column i+1
        //   is determined by given name then extend start of
        //   column i+1
        start[*it+1] = end[*it] + 1.;
      }
    }else{
      // If column i is not left justified then extend start of
      //   column i+1
      start[*it+1] = end[*it] + 1.;
    }
  }

  // Shrink columns to eliminate overlaps
  for(auto it = has_overlaps.begin(); it != has_overlaps.end(); ++it){
    bool ljust = false;
    for(auto ljit = left_justified.begin(); ljit != left_justified.end(); ++ljit){
      ljust = std::regex_search(std::string(cnames[*it]),
                                std::regex(std::string(*ljit)));
      if(ljust) break;
    }
    if(ljust){
      if(std::regex_search(std::string(regexpr[*it + 1]), std::regex("^ *"))){
        // If column i is left justified and start of column i+1
        //   is determined by regex shrink start of column i+1
        // Limit shift in start of column i+1 to width of name
        //   without extra spaces " *"
        std::string name = std::regex_replace(std::string(cnames[*it + 1]), std::regex("^ *"), "");
        end[*it] = end[*it + 1] - static_cast<double>(name.length());
        start[*it + 1] = end[*it] + 1.;
      }else{
        // If column i is left justified and start of column i+1
        //   is determined by given name then shrink end of
        //   column i
        end[*it] = start[*it + 1] - 1.;
      }
    }else{
      // If column i is not left justified then extend start of
      //   column i+1
      start[*it + 1] = end[*it] + 1.;
    }
  }

}

