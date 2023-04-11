require "numo/narray"
require "numo/gsl"

p "GSL statistics Demonstration"
p "Data input array"
x = Numo::DFloat[11.32,2.0,14.0,7.0,11.0,14.3]
p x
p "Array Mean"
x_mean = Numo::GSL::Stats.mean(x)
p x_mean
p "Array Standard Deviation"
x_sd = Numo::GSL::Stats.sd(x)
p x_sd
p "Sorted array"
x_sort = x.sort
p x_sort
p "Array Median"
x_median = Numo::GSL::Stats.median_from_sorted_data(x_sort)
p x_median
p "First quartile"
x_q1 = Numo::GSL::Stats.quantile_from_sorted_data(x_sort,0.25)
p x_q1
p "Third quartile"
x_q2 = Numo::GSL::Stats.quantile_from_sorted_data(x_sort,0.75)
p x_q2
~      
