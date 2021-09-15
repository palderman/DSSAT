#include <cpp11.hpp>
#include <string>
#include <regex>
#include <testthat.h>
using namespace cpp11;

void reconcile_gaps_cpp(writable::strings &cnames,
                        writable::strings &regexpr,
                        writable::strings &col_names,
                        writable::doubles &start,
                        writable::doubles &end,
                        writable::strings &left_justified){

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
    bool ljust;
    bool ljust2;
    if(i == 1){
      ljust = false;
      for(auto ljit = left_justified.begin(); ljit != left_justified.end(); ++ljit){
        ljust = cnames[i-1] == *ljit;
        if(ljust) break;
      }
    }else{
      ljust = ljust2;
    }
    ljust2 = false;
    for(auto ljit = left_justified.begin(); ljit != left_justified.end(); ++ljit){
      ljust2 = cnames[i] == *ljit;
      if(ljust2) break;
    }
    // Check for gaps between columns
    if(start[i] - end[i-1] > 1.){
      // Extend columns to fill in gaps
      if(ljust){
        if(ljust2 ||
           std::regex_search(std::string(r_string(regexpr[i])),std::regex("^ [*+]"))){
          // If column i-1 is left justified and start of column i
          //   is determined by regex extend end of column i-1
          end[i-1] = start[i] - 1.;
        }else{
          // If column i-1 is left justified and start of column i
          //   is determined by given name then extend start of
          //   column i
          start[i] = end[i-1] + 1.;
        }
      }else{
        // If column i-1 is not left justified then extend start of
        //   column i
        start[i] = end[i-1] + 1.;
      }
    }
    // Check for overlaps between columns
    if(start[i] - end[i-1] < 1.){
      // Shrink columns to eliminate overlaps
      if(ljust){
        if(std::regex_search(std::string(r_string(regexpr[i])), std::regex("^ [*+][^ ]"))){
          // If column i-1 is left justified and start of column i
          //   is determined by regex shrink start of column i
          // Limit shift in start of column i to width of name
          // std::string name = std::regex_replace(std::string(cnames[i]), std::regex("^ *"), "");
          double limit = static_cast<double>(std::string(r_string(cnames[i])).length());
          if(end[i] - end[i-1] > limit){
            end[i-1] = end[i] - limit;
          }else{
            start[i] = end[i-1] + 1.;
          }
        }else{
          // If column i-1 is left justified and start of column i
          //   is determined by given name then shrink end of
          //   column i-1
          end[i-1] = start[i] - 1.;
        }
      }else{
        // If column i-1 is not left justified then extend start of
        //   column i
        // THIS POSSIBLY NEEDS RETHINKING TO HANDLE when cnames[i-1]
        //   ends in spaces?
        start[i] = end[i-1] + 1.;
      }
    }
  }

}

