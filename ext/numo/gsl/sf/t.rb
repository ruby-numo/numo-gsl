require "numo/narray"
require "./sf.so"

p 2
p Numo::GSL::Sf.bessel_J0(2)

p a = Numo::DFloat[0..5]
p Numo::GSL::Sf.bessel_J0(a)


p lmax = 5
p x = 1.5
p Numo::GSL::Sf.bessel_il_scaled_array(lmax, x)

p x = Numo::DFloat.new(10).seq
p Numo::GSL::Sf.bessel_il_scaled_array(lmax, x)

p nmin = 10
p nmax = 14
p Numo::GSL::Sf.bessel_Jn_array(nmin, nmax, x)


p Numo::GSL::Sf::MathieuWorkspace.new(100,1.5)
