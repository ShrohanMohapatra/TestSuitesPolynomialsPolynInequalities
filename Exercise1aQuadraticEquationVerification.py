# Exercise1aQuadraticEquationVerification.py

import unittest
from sympy import *

class test_SymbolicVerifQuadraticEquation(unittest.TestCase):
    def test_ActualTestDriver(self):
        x = Symbol("x")
        b = Symbol("b")
        c = Symbol("c")
        origQuadraticEqn = x**2 + b*x + c
        firstRootCheckDataStruct = {
            x: -Rational(1, 2)*(b + (b**2 - 4*c)**Rational(1, 2)),
            x**2: Rational(1, 2)*(b**2 - 2*c + b*(b**2 - 4*c)**Rational(1, 2))
            }
        secondRootCheckDataStruct = {
            x: -Rational(1, 2)*(b - (b**2 - 4*c)**Rational(1, 2)),
            x**2: Rational(1, 2)*(b**2 - 2*c - b*(b**2 - 4*c)**Rational(1, 2))
        }
        self.assertTrue(expand(origQuadraticEqn.subs(firstRootCheckDataStruct).doit()) == 0)
        self.assertTrue(expand(origQuadraticEqn.subs(secondRootCheckDataStruct).doit()) == 0)

if __name__ == "__main__":
    unittest.main()