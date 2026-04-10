# Exercise1bCubicEquationVerif.py

import unittest
from sympy import *

class test_Exercise1bCubicEquationVerif(unittest.TestCase):
    def test_SquareComplex(self):
        x = Symbol("x")
        y = Symbol("y")
        zSquare = expand((x+I*y)**2)
        xSquare = x**2 - y**2
        ySquare = 2*x*y
        self.assertTrue(expand(zSquare - xSquare - I*ySquare) == 0)
    def test_SquareRootComplex(self):
        xA = Symbol("xA")
        yA = Symbol("yA")
        xSquareRoot = (Rational(1, 2)*((xA**2 + yA**2)**Rational(1, 2) + xA))**Rational(1, 2)
        ySquareRoot = (Rational(1, 2)*((xA**2 + yA**2)**Rational(1, 2) - xA))**Rational(1, 2)
        zA = expand((xSquareRoot + I*ySquareRoot)**2)
        dictDataStructure = {
            (Rational(1, 2)*(xA**2 + yA**2)**Rational(1, 2) + Rational(1, 2)*xA)**Rational(1, 2)*(Rational(1, 2)*(xA**2 + yA**2)**Rational(1, 2) - Rational(1, 2)*xA)**Rational(1, 2): Rational(1, 2)*yA 
            }
        zA = expand(zA.subs(dictDataStructure))
        self.assertTrue(expand(zA - xA - I*yA) == 0)
    def test_cubeComplex(self):
        x = Symbol("x")
        y = Symbol("y")
        z = x + I*y
        zCube = expand(z**3)
        realPartZcube = expand(x*(x**2 - 3*y**2))
        imagPartZcube = expand(y*(3*x**2 - y**2))
        self.assertTrue(expand(zCube - realPartZcube - I*imagPartZcube) == 0)
    def test_jacobian(self):
        x = Symbol("x")
        y = Symbol("y")
        realPartZube = expand(x*(x**2 - 3*y**2))
        imagPartZcube = expand(y*(3*x**2 - y**2))
        jacobianMatrix = [
            [diff(realPartZube, x), diff(realPartZube, y)],
            [diff(imagPartZcube, x), diff(imagPartZcube, y)]
            ]
        expectedJacobianMatrix = [
            [3*x**2 - 3*y**2, -6*x*y],
            [6*x*y, 3*x**2 - 3*y**2]
            ]
        self.assertTrue(
            expand(jacobianMatrix[0][0] - expectedJacobianMatrix[0][0]) == 0
            )
        self.assertTrue(
            expand(jacobianMatrix[0][1] - expectedJacobianMatrix[0][1]) == 0
            )
        self.assertTrue(
            expand(jacobianMatrix[1][0] - expectedJacobianMatrix[1][0]) == 0
            )
        self.assertTrue(
            expand(jacobianMatrix[1][1] - expectedJacobianMatrix[1][1]) == 0
            )
    def test_TwoDmatrixInvCheck(self):
        a = Symbol("a")
        b = Symbol("b")
        c = Symbol("c")
        d = Symbol("d")
        M = [[a, b], [c, d]]
        detM = a*d-b*c
        Minv = [[d/detM, -b/detM], [-c/detM, a/detM]]
        verifCheckI = [[0, 0],[0, 0]]
        verifCheckI[0][0] = simplify(expand(M[0][0]*Minv[0][0] + M[0][1]*Minv[1][0]))
        verifCheckI[0][1] = simplify(expand(M[0][0]*Minv[0][1] + M[0][1]*Minv[1][1]))
        verifCheckI[1][0] = simplify(expand(M[1][0]*Minv[0][0] + M[1][1]*Minv[1][0]))
        verifCheckI[1][1] = simplify(expand(M[1][0]*Minv[0][1] + M[1][1]*Minv[1][1]))
        self.assertTrue(verifCheckI[0][0] == 1)
        self.assertTrue(verifCheckI[0][1] == 0)
        self.assertTrue(verifCheckI[1][0] == 0)
        self.assertTrue(verifCheckI[1][1] == 1)
    def test_TwoDmatrixInvSpecificCheck(self):
        x = Symbol("x")
        y = Symbol("y")
        realPartZube = expand(x*(x**2 - 3*y**2))
        imagPartZcube = expand(y*(3*x**2 - y**2))
        jacobianMatrix = [
            [3*x**2 - 3*y**2, -6*x*y],
            [6*x*y, 3*x**2 - 3*y**2]
            ]
        invJacobianMatrix = [
            [Rational(1, 3)*(x**2 - y**2)/(x**2 + y**2)**2, Rational(2, 3)*x*y/(x**2 + y**2)**2],
            [-Rational(2, 3)*x*y/(x**2 + y**2)**2, Rational(1, 3)*(x**2 - y**2)/(x**2 + y**2)**2]
            ]
        verifCheckIdMatrix = [[0, 0], [0, 0]]
        verifCheckIdMatrix[0][0] = simplify(
            expand(
                jacobianMatrix[0][0]*invJacobianMatrix[0][0] \
                + jacobianMatrix[0][1]*invJacobianMatrix[1][0]
                )
            )
        verifCheckIdMatrix[0][1] = simplify(
            expand(
                jacobianMatrix[0][0]*invJacobianMatrix[0][1] \
                + jacobianMatrix[0][1]*invJacobianMatrix[1][1]
                )
            )
        verifCheckIdMatrix[1][0] = simplify(
            expand(
                jacobianMatrix[1][0]*invJacobianMatrix[0][0] \
                + jacobianMatrix[1][1]*invJacobianMatrix[1][0]
                )
            )
        verifCheckIdMatrix[1][1] = simplify(
                expand(
                    jacobianMatrix[1][0]*invJacobianMatrix[0][1] \
                    + jacobianMatrix[1][1]*invJacobianMatrix[1][1]
                    )
                )
        self.assertTrue(verifCheckIdMatrix[0][0] == 1)
        self.assertTrue(verifCheckIdMatrix[0][1] == 0)
        self.assertTrue(verifCheckIdMatrix[1][0] == 0)
        self.assertTrue(verifCheckIdMatrix[1][1] == 1)


if __name__ == "__main__":
    unittest.main()
    