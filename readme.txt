Hi Fan, 

Nice meeting you today!

Here are the files: 

(1) 9_1_llmnl_initial_mcprice.R ！ new likelihood function file, to be written in Rcpp 
(2) 9_1_corrLike.R ！ old overall function, just for your reference
(3) rhierMnlRwMixture_rcpp_loop.cpp ！ new c++ functions that need to be adjusted (3 new functions created, one based on  9_1_llmnl_initial_mcprice.R, and two that just call these functions with all the inputs)
(4) rhierMnlRwMixture_rcpp.R ！ new overall function that calls functions defined by (3).  

Also, here is a link to the bayesm package: https://cran.r-project.org/web/packages/bayesm/index.html
GitHub repo for this package: https://github.com/cran/bayesm

Just to recap, the task is to create three new Rcpp files that are in (3), using function defined in (1) instead of llmnl_con function there, and make sure that these new functions properly use objects defined in the bayesm package. 

Feel free to shoot me an email if you have some questions! 

Thanks!