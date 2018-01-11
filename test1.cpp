#include <bayesm.h>
using namespace std;
int my_rmultinomF(vec p) {
  vec r(1,fill::randu);
  vec cp = cumsum(p);
  int counter=0;
  for(int i=0;i<cp.size();i++){
    if(r[0]>cp[i]){
      counter += 1;
    }
  }
  return(counter+1);
};

// [[Rcpp::export]]

mat bb(mat x, vec const& y,mat xx) {
 // mat X=x(2,span(0, 8));
  
  //rowvec Y = x.row(0);
  //Y.fill(1.0/(n-1));
  for(int i=0;i<x.n_cols;i++){
    x(i,0)=xx(0,i);
  }
  x.row(2)= y;
  return x;
}
