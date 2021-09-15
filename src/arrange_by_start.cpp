#include <cpp11.hpp>
#include <vector>
#include <numeric>
using namespace cpp11;

void arrange_by_start(cpp11::writable::doubles &beg_in,
                      cpp11::writable::doubles &end_in,
                      cpp11::writable::strings &regex_in,
                      cpp11::writable::strings &col_names,
                      cpp11::writable::strings &cnames){

  writable::doubles beg_out(beg_in.size());
  writable::doubles end_out(beg_in.size());
  writable::strings regex_out(beg_in.size());
  writable::strings col_names_out(beg_in.size());
  writable::strings cnames_out(beg_in.size());

  std::vector<std::size_t> ind(beg_in.size());
  std::iota(ind.begin(), ind.end(), 0);
  std::sort(ind.begin(), ind.end(),
            [&](size_t a, size_t b) { return beg_in[a] < beg_in[b]; });

  // Fill _out vectors to store in proper order
  for(size_t i=0; i<ind.size(); ++i){
    beg_out[i] = double(beg_in[ind[i]]);
    end_out[i] = double(end_in[ind[i]]);
    regex_out[i] = r_string(regex_in[ind[i]]);
    col_names_out[i] = r_string(col_names[ind[i]]);
    cnames_out[i] = r_string(cnames[ind[i]]);
  }

  // Assign values in proper order
  for(size_t i=0; i<ind.size(); ++i){
    beg_in[i] = double(beg_out[i]);
    end_in[i] = double(end_out[i]);
    regex_in[i] = r_string(regex_out[i]);
    col_names[i] = r_string(col_names_out[i]);
    cnames[i] = r_string(cnames_out[i]);
  }

}
