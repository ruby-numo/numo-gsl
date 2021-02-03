[{:func_name=>"gsl_ran_bernoulli_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"]],
  :desc=>
   "This function computes the probability p(k) of obtaining\n" +
   "k from a Bernoulli distribution with probability parameter\n" +
   "p, using the formula given above."},
 {:func_name=>"gsl_ran_beta_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a beta distribution with parameters a and b, using the\n" +
   "formula given above."},
 {:func_name=>"gsl_ran_binomial_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"], ["unsigned int", "n"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a binomial distribution with parameters p and n, using\n" +
   "the formula given above."},
 {:func_name=>"gsl_ran_bivariate_gaussian_pdf",
  :func_type=>"double",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["double", "sigma_x"],
    ["double", "sigma_y"],
    ["double", "rho"]],
  :desc=>
   "This function computes the probability density p(x,y) at\n" +
   "(x,y) for a bivariate Gaussian distribution with standard\n" +
   "deviations sigma_x, sigma_y and correlation coefficient\n" +
   "rho, using the formula given above."},
 {:func_name=>"gsl_ran_cauchy_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Cauchy distribution with scale parameter a, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_chisq_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "nu"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a chi-squared distribution with nu degrees of freedom, using\n" +
   "the formula given above."},
 {:func_name=>"gsl_ran_dirichlet_lnpdf",
  :func_type=>"double",
  :args=>
   [["size_t", "K"], ["const double", "alpha[]"], ["const double", "theta[]"]],
  :desc=>
   "This function computes the logarithm of the probability density \n" +
   "$p(\\theta_1, \\ldots , \\theta_K)$\n" +
   "p(\\theta_1, ... , \\theta_K)\n" +
   "for a Dirichlet distribution with parameters \n" +
   "alpha[K]."},
 {:func_name=>"gsl_ran_dirichlet_pdf",
  :func_type=>"double",
  :args=>
   [["size_t", "K"], ["const double", "alpha[]"], ["const double", "theta[]"]],
  :desc=>
   "This function computes the probability density \n" +
   "$p(\\theta_1, \\ldots , \\theta_K)$\n" +
   "p(\\theta_1, ... , \\theta_K)\n" +
   "at theta[K] for a Dirichlet distribution with parameters \n" +
   "alpha[K], using the formula given above."},
 {:func_name=>"gsl_ran_discrete_pdf",
  :func_type=>"double",
  :args=>[["size_t", "k"], ["const gsl_ran_discrete_t *", "g"]],
  :desc=>
   "Returns the probability P[k] of observing the variable k.\n" +
   "Since P[k] is not stored as part of the lookup table, it must be\n" +
   "recomputed; this computation takes O(K), so if K is large\n" +
   "and you care about the original array P[k] used to create the\n" +
   "lookup table, then you should just keep this original array P[k]\n" +
   "around."},
 {:func_name=>"gsl_ran_exponential_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "mu"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for an exponential distribution with mean mu, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_exppow_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for an exponential power distribution with scale parameter a\n" +
   "and exponent b, using the formula given above."},
 {:func_name=>"gsl_ran_fdist_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "nu1"], ["double", "nu2"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for an F-distribution with nu1 and nu2 degrees of freedom,\n" +
   "using the formula given above."},
 {:func_name=>"gsl_ran_flat_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a uniform distribution from a to b, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_gamma_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a gamma distribution with parameters a and b, using the\n" +
   "formula given above."},
 {:func_name=>"gsl_ran_gaussian_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "sigma"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Gaussian distribution with standard deviation sigma, using\n" +
   "the formula given above."},
 {:func_name=>"gsl_ran_gaussian_tail_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "sigma"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Gaussian tail distribution with standard deviation sigma and\n" +
   "lower limit a, using the formula given above."},
 {:func_name=>"gsl_ran_geometric_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a geometric distribution with probability parameter p, using\n" +
   "the formula given above."},
 {:func_name=>"gsl_ran_gumbel1_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Type-1 Gumbel distribution with parameters a and b,\n" +
   "using the formula given above."},
 {:func_name=>"gsl_ran_gumbel2_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Type-2 Gumbel distribution with parameters a and b,\n" +
   "using the formula given above."},
 {:func_name=>"gsl_ran_hypergeometric_pdf",
  :func_type=>"double",
  :args=>
   [["unsigned int", "k"],
    ["unsigned int", "n1"],
    ["unsigned int", "n2"],
    ["unsigned int", "t"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a hypergeometric distribution with parameters n1, n2,\n" +
   "t, using the formula given above."},
 {:func_name=>"gsl_ran_landau_pdf",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for the Landau distribution using an approximation to the formula given\n" +
   "above."},
 {:func_name=>"gsl_ran_laplace_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Laplace distribution with width a, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_logarithmic_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a logarithmic distribution with probability parameter p,\n" +
   "using the formula given above."},
 {:func_name=>"gsl_ran_logistic_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a logistic distribution with scale parameter a, using the\n" +
   "formula given above."},
 {:func_name=>"gsl_ran_lognormal_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "zeta"], ["double", "sigma"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a lognormal distribution with parameters zeta and sigma,\n" +
   "using the formula given above."},
 {:func_name=>"gsl_ran_multinomial_lnpdf",
  :func_type=>"double",
  :args=>
   [["size_t", "K"], ["const double", "p[]"], ["const unsigned int", "n[]"]],
  :desc=>
   "This function returns the logarithm of the probability for the\n" +
   "multinomial distribution $P(n_1, n_2, \\ldots, n_K)$\n" +
   "P(n_1, n_2, ..., n_K) with parameters p[K]."},
 {:func_name=>"gsl_ran_multinomial_pdf",
  :func_type=>"double",
  :args=>
   [["size_t", "K"], ["const double", "p[]"], ["const unsigned int", "n[]"]],
  :desc=>
   "This function computes the probability \n" +
   "$P(n_1, n_2, \\ldots, n_K)$\n" +
   "P(n_1, n_2, ..., n_K)\n" +
   "of sampling n[K] from a multinomial distribution \n" +
   "with parameters p[K], using the formula given above."},
 {:func_name=>"gsl_ran_negative_binomial_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"], ["double", "n"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a negative binomial distribution with parameters p and\n" +
   "n, using the formula given above."},
 {:func_name=>"gsl_ran_pareto_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Pareto distribution with exponent a and scale b, using\n" +
   "the formula given above."},
 {:func_name=>"gsl_ran_pascal_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "p"], ["unsigned int", "n"]],
  :desc=>
   "This function computes the probability p(k) of obtaining k\n" +
   "from a Pascal distribution with parameters p and\n" +
   "n, using the formula given above."},
 {:func_name=>"gsl_ran_poisson_pdf",
  :func_type=>"double",
  :args=>[["unsigned int", "k"], ["double", "mu"]],
  :desc=>
   "This function computes the probability p(k) of obtaining  k\n" +
   "from a Poisson distribution with mean mu, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_rayleigh_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "sigma"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Rayleigh distribution with scale parameter sigma, using the\n" +
   "formula given above."},
 {:func_name=>"gsl_ran_rayleigh_tail_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "sigma"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Rayleigh tail distribution with scale parameter sigma and\n" +
   "lower limit a, using the formula given above."},
 {:func_name=>"gsl_ran_tdist_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "nu"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a t-distribution with nu degrees of freedom, using the formula\n" +
   "given above."},
 {:func_name=>"gsl_ran_ugaussian_pdf",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These functions compute results for the unit Gaussian distribution.  They\n" +
   "are equivalent to the functions above with a standard deviation of one,\n" +
   "sigma = 1."},
 {:func_name=>"gsl_ran_ugaussian_tail_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"]],
  :desc=>
   "These functions compute results for the tail of a unit Gaussian\n" +
   "distribution.  They are equivalent to the functions above with a standard\n" +
   "deviation of one, sigma = 1."},
 {:func_name=>"gsl_ran_weibull_pdf",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "a"], ["double", "b"]],
  :desc=>
   "This function computes the probability density p(x) at x\n" +
   "for a Weibull distribution with scale a and exponent b,\n" +
   "using the formula given above."}]
