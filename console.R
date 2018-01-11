library('Rcpp')
library('devtools')
find_rtools(T)
<<<<<<< HEAD
#library('RcppEigen')
library('bayesm')
library('RcppArmadillo')

sourceCpp("llmnl_initial_mcprice_bayesm.cpp")

sourceCpp("rhierMnlRwMixture_rcpp_loop2.cpp")
sourceCpp("test1.cpp")
sourceCpp("getEigenValues.cpp")
bb(tmp)

vec <- matrix(1:100,10)
vectmp <- matrix(1:100,10)
vectmp <- 1:10
vec1 <- matrix(runif(100),10,10)
vec2 <- matrix(runif(10),5,2)
tmp <- runif(10)
bb(vec,tmp,vectmp)
my_rmultinomF(tmp)
=======
#install.packages("RcppEigen")
library('RcppEigen')

sourceCpp("llmnl_initial_mcprice.cpp")
sourceCpp("test.cpp")
sourceCpp("getEigenValues.cpp")
bb(tmp)

vec <- runif(10)
timesTwo(vec)
rmultinomF(3)
>>>>>>> b4340808b0b248c676126dcb29c8fc3f10edd862



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

<<<<<<< HEAD




betac=rnorm(11)
y=rnorm(10)
X=matrix(1:1000,100)
count_out=10
initial_price_id=5
initial_price_state_dropped=matrix(runif(100),10)*10
initial_price_state_dropped=runif(10)
s1=5
transition_matrix_median_steps=matrix(runif(100),10)
price_transition_states=matrix(rnorm(100),10)
vec_price_states_probs=runif(10)
draws_length=5
number_price_simulations=10
flag_markovian=TRUE
flag_know_state=FALSE

sourceCpp("llmnl_initial_mcprice_bayesm.cpp")
llmnl_initial_mcprice2(betac,y,X,count_out,initial_price_id,initial_price_state_dropped,s1,
                      transition_matrix_median_steps,price_transition_states,
                      vec_price_states_probs,draws_length,number_price_simulations,
                      flag_markovian,flag_know_state)

=======
>>>>>>> b4340808b0b248c676126dcb29c8fc3f10edd862
