# Exercise1cCubicEquationSymbolicVerif.py

from sympy import *

x = Symbol("x")
a = Symbol("a")
b = Symbol("b")
c = Symbol("c")
z = Symbol("z")
g = Symbol("g")

cubicPolynomial = x**3 + a*x**2 + b*x + c
freshCubicPolynomial = expand(cubicPolynomial.subs({x: z - Rational(1, 3)*a}).doit())
assert(freshCubicPolynomial.coeff(z, 2) == 0)
