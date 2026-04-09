// Exercise1bCubicEquationNumericVerif.cpp

#include<cassert>
#include<cmath>

using namespace std;

struct customComplex {
    long double realPart;
    long double imagPart;
};

customComplex squareComplex(customComplex inputComplex){
    long double x, y;
    customComplex returnSquareComplex;
    x = inputComplex.realPart;
    y = inputComplex.imagPart;
    returnSquareComplex.realPart = x*x - y*y;
    returnSquareComplex.imagPart = 2*x*y;
    return returnSquareComplex;
}

void squareComplexExample1(){
    long double x, y, xSq, ySq;
    x = 0.0000;
    y = 1.0000;
    customComplex z, zSq;
    z.realPart = x;
    z.imagPart = y;
    zSq = squareComplex(z);
    xSq = zSq.realPart;
    ySq = zSq.imagPart;
    assert(fabs(xSq + 1.0000) < powf(10.0000, -16.0000));
    assert(fabs(ySq) < powf(10.0000, -16.0000));
}

void squareComplexExample2(){
    long double x, y, xSq, ySq;
    x = 1.0000/sqrt(2.0000);
    y = 1.0000/sqrt(2.0000);
    customComplex z, zSq;
    z.realPart = x;
    z.imagPart = y;
    zSq = squareComplex(z);
    xSq = zSq.realPart;
    ySq = zSq.imagPart;
    assert(fabs(xSq) < powf(10.0000, -16.0000));
    assert(fabs(ySq - 1.0000) < powf(10.0000, -15.0000));
}

int main(){
    squareComplexExample1();
    squareComplexExample2();
    return 0;
}