library('Rcpp')
library('devtools')
find_rtools(T)
#install.packages("RcppEigen")
library('RcppEigen')

sourceCpp("llmnl_initial_mcprice.cpp")
sourceCpp("test.cpp")
sourceCpp("getEigenValues.cpp")
bb(tmp)

vec <- runif(10)
timesTwo(vec)
rmultinomF(3)



bb <- 'int bb(NumericVector a){
  Rcpp::Environment global = Rcpp::Environment::global_env();
Function rmultinomF = global["rmultinomF"];
NumericVector x = rmultinomF(a);
return (x[0] + 1);
}'
bb <- '
NumericMatrix mmult(const NumericMatrix& m1, const NumericMatrix& m2){
  if (m1.ncol() != m2.nrow()) stop ("Incompatible matrix dimensions");
NumericMatrix out(m1.nrow(),m2.ncol());
NumericVector rm1, cm2;
for (size_t i = 0; i < m1.nrow(); ++i) {
rm1 = m1(i,_);
for (size_t j = 0; j < m2.ncol(); ++j) {
cm2 = m2(_,j);
out(i,j) = std::inner_product(rm1.begin(), rm1.end(), cm2.begin(), 0.);              
}
}
return out;
};'
bb<-'
NumericMatrix mmult(NumericMatrix m1,NumericMatrix m2){
  if (m1.ncol() != m2.nrow()) stop ("Incompatible matrix dimensions");
NumericMatrix out(m1.nrow(),m2.ncol());
NumericVector rm1, cm2;
for (size_t i = 0; i < m1.nrow(); ++i) {
rm1 = m1(i,_);
for (size_t j = 0; j < m2.ncol(); ++j) {
cm2 = m2(_,j);
out(i,j) = std::inner_product(rm1.begin(), rm1.end(), cm2.begin(), 0.);              
}
}
return out;
};
'
bb <- '
NumericMatrix bb(int k){
NumericMatrix x(k,k);
std::fill(x.begin(),x.end(),1);
NumericVector y(k);
std::fill(y.begin(),y.end(),2);
y.attr("dim") = Dimension(k, 1);
Rcpp::Environment global = Rcpp::Environment::global_env();
Function mmult = global["mmult"];
return mmult(x,y);}
'
cppFunction(bb)
bb(5)

