#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List scalar_missings() {
  int    int_s  = NA_INTEGER;
  String chr_s  = NA_STRING;
  bool   lgl_s  = NA_LOGICAL;
  double dbl_s  = NA_REAL;
  return List::create(int_s, chr_s, lgl_s, dbl_s);
}

// [[Rcpp::export]]
LogicalVector is_naC(NumericVector x) {
  int n = x.size();
  LogicalVector out(n);
  for (int i = 0; i < n; ++i) {
    out[i] = NumericVector::is_na(x[i]);
  }
  return out;
}
