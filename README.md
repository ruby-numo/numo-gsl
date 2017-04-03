# GSL interface for Ruby with Numo::NArray

* Pre-alpha version under development.
* [GitHub site](https://github.com/ruby-numo/gsl)

## [Numo::GSL API document](http://ruby-numo.github.io/gsl/doc/)

Implemented Modules:

* [Numo::GSL -- Mathematical Functions](http://ruby-numo.github.io/gsl/doc/Numo/GSL.html)
  * (Modules/Classes below are defined in Numo::GSL module, e.g., Const => Numo::GSL::Const)
* [Const -- Constants](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Const.html)
* [Poly -- Polynomials](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Poly.html)
* [Sf -- Special Functions](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Sf.html)
* [Rng -- Random Number Generation](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Rng.html)
  * [Ran -- Random Number Distriutions](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Ran.html)
  * [Pdf -- Probability Density Functions](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Pdf.html)
  * [Cdf -- Cumulative Distribution Functions](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Cdf.html)
* [Stats -- Statistics](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Stats.html)
  * [Rstat -- Runnning Statistics](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Rstat.html)
* [Histogram -- Histograms](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Histogram.html)
  * [Histogram2D -- 2D Histograms](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Histogram2D.html)
* [Spline -- Interpolarion](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Spline.html)
  * [Spline2D -- 2D Interpolarion](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Spline2D.html)
* [Wavelet -- Wavelet Transforms](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Wavelet.html)
  * [Wavelet2D -- 2D Wavelet Transforms](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Wavelet2D.html)
* [Fit -- Linear regression](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Fit.html)
  * [Multifit -- Multi-parameter regression](http://ruby-numo.github.io/gsl/doc/Numo/GSL/Multifit.html)
* [SpMatrix -- Sparse Matrices](http://ruby-numo.github.io/gsl/doc/Numo/GSL/SpMatrix.html)
  * [SpBlas -- Sparse BLAS](http://ruby-numo.github.io/gsl/doc/Numo/GSL/SpBlas.html)
  * [SpLinalg -- Sparse Linear Algebra](http://ruby-numo.github.io/gsl/doc/Numo/GSL/SpLinalg.html)

More modules will be implemented.

## Naming convention

```
    [C] GSL function/constant => [Ruby] Numo::GSL function/constant
* Constants
    M_2_PI                    => Numo::GSL::M_2_PI
    GSL_CONST_MKSA_ANGSTROM   => Numo::GSL::Const::MKSA_ANGSTROM
* Module function
    gsl_acosh()               => Numo::GSL.acosh()
    gsl_sf_bessel_J0()        => Numo::GSL::Sf.bessel_J0()
* Class method
    gsl_rng_alloc()           => Numo::GSL::Rng.new
    gsl_rng_get()             => Numo::GSL::Rng#get
* Subclass
    gsl_rng_type *gsl_rng_mt19937; => Numo::GSL::Rng::Mt19937 < Numo::GSL::Rng
* Exception
    gsl_ran_gaussian_pdf()    => Numo::GSL::Pdf.gaussian
    gsl_ran_gaussian()        => Numo::GSL::Rng#gaussian (Rng includes Numo::GSL::Ran)
```

## Installation

* Install [Numo::NArray](https://github.com/ruby-numo/narray)
* Install [GSL - GNU Scientific Library](http://www.gnu.org/software/gsl/) - version >=2.0, <=2.3. (only tested in 2.1 and 2.3)

* Install Numo::GSL
  ```shell
$ git clone git://github.com/ruby-numo/gsl.git
$ cd gsl
$ rake build
$ gem install pkg/numo-gsl-*.gem
```

rubygems is to be created.

# Quick start

If you're familiar with Docker, the following commands should work in most cases:

```
git clone https://github.com/ruby-numo/gsl
cd gsl
docker build -t numogsl .
docker run -d -p 8888:8888 numogsl start-notebook.sh --NotebookApp.token=''
```

and open a web browser to http://localhost:8888 .

Our Docker image is based on Minimal Jupyter Notebook Stack. See https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook for more details on the Docker command options.
