// Exercise1bCubicEquationNumericVerif.cpp

#include<iostream>
#include<random>
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

customComplex squareRootComplex(customComplex inputComplex){
    long double x, y;
    customComplex returnSquareComplex;
    x = inputComplex.realPart;
    y = inputComplex.imagPart;
    returnSquareComplex.realPart = sqrt(1.0000/2.0000*(sqrt(x*x + y*y) + x));
    returnSquareComplex.imagPart = sqrt(1.0000/2.0000*(sqrt(x*x + y*y) - x));
    return returnSquareComplex;
}

customComplex cubeComplex(customComplex inputComplex){
    long double x, y;
    customComplex zCube;
    x = inputComplex.realPart;
    y = inputComplex.imagPart;
    zCube.realPart = x*(x*x - 3*y*y);
    zCube.imagPart = y*(3*x*x - y*y);
    return zCube;
}

customComplex cubeRootComplex(customComplex inputComplex){
    long double xA, yA, absZcubeRootA, phiA, phiCubeRootA;
    customComplex zCubeRoot;
    xA = inputComplex.realPart;
    yA = inputComplex.imagPart;
    absZcubeRootA = powl(xA*xA + yA*yA, 1.0000/6.0000);
    phiA = atan2(yA, xA);
    phiCubeRootA = 1.0000/3.0000*phiA;
    zCubeRoot.realPart = absZcubeRootA*cos(phiCubeRootA);
    zCubeRoot.imagPart = absZcubeRootA*sin(phiCubeRootA);
    return zCubeRoot;
}

bool cubicEquationRootMainVerifHandle(customComplex bCoeff, customComplex cCoeff){
    customComplex bCoeffCube = cubeComplex(bCoeff);
    customComplex cCoeffSquare = squareComplex(cCoeff);
    long double discrimRealPart, discrimImagPart;
    discrimRealPart = 1.0000/4.0000*cCoeffSquare.realPart + 1.0000/27.0000*bCoeffCube.realPart;
    discrimImagPart = 1.0000/4.0000*cCoeffSquare.imagPart + 1.0000/27.0000*bCoeffCube.imagPart;
    customComplex discrimCubicEquation, sqrtDiscrimCubicEquation;
    discrimCubicEquation.realPart = discrimRealPart;
    discrimCubicEquation.imagPart = discrimImagPart;
    sqrtDiscrimCubicEquation = squareRootComplex(discrimCubicEquation);
    customComplex alphaCubeCoeff, betaCubeCoeff, alphaCoeff, betaCoeff;
    alphaCubeCoeff.realPart = -1.0000/2.0000*cCoeff.realPart + sqrtDiscrimCubicEquation.realPart;
    alphaCubeCoeff.imagPart = -1.0000/2.0000*cCoeff.imagPart + sqrtDiscrimCubicEquation.imagPart;
    betaCubeCoeff.realPart = -1.0000/2.0000*cCoeff.realPart - sqrtDiscrimCubicEquation.realPart;
    betaCubeCoeff.imagPart = -1.0000/2.0000*cCoeff.imagPart - sqrtDiscrimCubicEquation.imagPart;
    alphaCoeff = cubeRootComplex(alphaCubeCoeff);
    betaCoeff = cubeRootComplex(betaCubeCoeff);
    customComplex root1CubicEquation, cubeOfRoot1CubicEquation, verifRoot1CubicEquation;
    long double absRoot1CubicEquation;
    root1CubicEquation.realPart = alphaCoeff.realPart + betaCoeff.realPart;
    root1CubicEquation.imagPart = alphaCoeff.imagPart + betaCoeff.imagPart;
    cubeOfRoot1CubicEquation = cubeComplex(root1CubicEquation);
    verifRoot1CubicEquation.realPart = cubeOfRoot1CubicEquation.realPart
                                        + bCoeffCube.realPart*root1CubicEquation.realPart
                                        - bCoeffCube.imagPart*root1CubicEquation.imagPart
                                        + cCoeff.realPart;
    verifRoot1CubicEquation.imagPart = cubeOfRoot1CubicEquation.realPart
                                        + bCoeffCube.realPart*root1CubicEquation.imagPart
                                        + bCoeffCube.imagPart*root1CubicEquation.realPart
                                        + cCoeff.imagPart;
    absRoot1CubicEquation = sqrt(
        verifRoot1CubicEquation.realPart*verifRoot1CubicEquation.realPart
        + verifRoot1CubicEquation.imagPart*verifRoot1CubicEquation.imagPart
        );
    cout << "|p(z1)| = " << absRoot1CubicEquation << endl;
    return true;
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

void squareComplexExample3(){
    long double x, y, xSq, ySq;
    x = 3.0000;
    y = 2.0000;
    customComplex z, zSq;
    z.realPart = x;
    z.imagPart = y;
    zSq = squareComplex(z);
    xSq = zSq.realPart;
    ySq = zSq.imagPart;
    long double errorTolerance = powf(10.0000, -16.0000);
    assert(fabs(xSq - 5.0000) < errorTolerance);
    assert(fabs(ySq - 12.0000) < errorTolerance);
}

void squareComplexExample4(){
    long double x, y, xSq, ySq;
    x = 4.0000;
    y = 3.0000;
    customComplex z, zSq;
    z.realPart = x;
    z.imagPart = y;
    zSq = squareComplex(z);
    xSq = zSq.realPart;
    ySq = zSq.imagPart;
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(xSq - 7.0000) < errorTolerance);
    assert(fabs(ySq - 24.0000) < errorTolerance);
}

void squareRootExample1(){
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformDistrib(0.0001, 100.0000);
    long double x, y, xSquare, ySquare, xExtract, yExtract;
    x = -50.0000 + uniformDistrib(gen);
    y = -50.0000 + uniformDistrib(gen);
    customComplex z, zSquare, SquareRootOfzSquare;
    z.realPart = x;
    z.imagPart = y;
    zSquare = squareComplex(z);
    SquareRootOfzSquare = squareRootComplex(zSquare);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(SquareRootOfzSquare.realPart-x) < errorTolerance);
    assert(fabs(SquareRootOfzSquare.imagPart-y) < errorTolerance);
}

void squareRootExample2(){
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformDistrib(0.0001, 100.0000);
    long double x, y, xSquare, ySquare, xExtract, yExtract;
    x = -50.0000 + uniformDistrib(gen);
    y = -50.0000 + uniformDistrib(gen);
    customComplex z, zSquare, SquareRootOfzSquare;
    z.realPart = x;
    z.imagPart = y;
    zSquare = squareComplex(z);
    SquareRootOfzSquare = squareRootComplex(zSquare);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(SquareRootOfzSquare.realPart-x) < errorTolerance);
    assert(fabs(SquareRootOfzSquare.imagPart-y) < errorTolerance);
}

void squareRootExample3(){
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformDistrib(0.0001, 100.0000);
    long double x, y, xSquare, ySquare, xExtract, yExtract;
    x = -50.0000 + uniformDistrib(gen);
    y = -50.0000 + uniformDistrib(gen);
    customComplex z, zSquare, SquareRootOfzSquare;
    z.realPart = x;
    z.imagPart = y;
    zSquare = squareComplex(z);
    SquareRootOfzSquare = squareRootComplex(zSquare);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(SquareRootOfzSquare.realPart-x) < errorTolerance);
    assert(fabs(SquareRootOfzSquare.imagPart-y) < errorTolerance);
}

void squareRootExample4(){
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformDistrib(0.0001, 100.0000);
    long double x, y, xSquare, ySquare, xExtract, yExtract;
    x = -50.0000 + uniformDistrib(gen);
    y = -50.0000 + uniformDistrib(gen);
    customComplex z, zSquare, SquareRootOfzSquare;
    z.realPart = x;
    z.imagPart = y;
    zSquare = squareComplex(z);
    SquareRootOfzSquare = squareRootComplex(zSquare);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(SquareRootOfzSquare.realPart-x) < errorTolerance);
    assert(fabs(SquareRootOfzSquare.imagPart-y) < errorTolerance);
}

void squareRootExample5(){
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformDistrib(0.0001, 100.0000);
    long double x, y, xSquare, ySquare, xExtract, yExtract;
    x = -50.0000 + uniformDistrib(gen);
    y = -50.0000 + uniformDistrib(gen);
    customComplex z, zSquare, SquareRootOfzSquare;
    z.realPart = x;
    z.imagPart = y;
    zSquare = squareComplex(z);
    SquareRootOfzSquare = squareRootComplex(zSquare);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(SquareRootOfzSquare.realPart-x) < errorTolerance);
    assert(fabs(SquareRootOfzSquare.imagPart-y) < errorTolerance);
}

void complexCubeExample1(){
    long double xCube, yCube;
    customComplex z, zCube;
    z.realPart = 2*sqrt(3) + 1;
    z.imagPart = 2;
    zCube = cubeComplex(z);
    xCube = 25 + 6*sqrt(3);
    yCube = 70 + 24*sqrt(3);
    long double errorTolerance = powf(10.0000, -14.0000);
    assert(fabs(zCube.realPart - xCube) < errorTolerance);
    assert(fabs(zCube.imagPart - yCube) < errorTolerance);
}

void complexCubeExample2(){
    long double xCube, yCube;
    customComplex z, zCube;
    z.realPart = 3*sqrt(3) + 2;
    z.imagPart = 3;
    zCube = cubeComplex(z);
    xCube = 116 + 36*sqrt(3);
    yCube = 252 + 108*sqrt(3);
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(zCube.realPart - xCube) < errorTolerance);
    assert(fabs(zCube.imagPart - yCube) < errorTolerance);
}

void complexCubeExample3(){
    long double xCube, yCube;
    customComplex z, zCube;
    z.realPart = 5*sqrt(3) + 12;
    z.imagPart = 5;
    zCube = cubeComplex(z);
    xCube = 3528 + 2160*sqrt(3);
    yCube = 3160 + 1800*sqrt(3);
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(zCube.realPart - xCube) < errorTolerance);
    assert(fabs(zCube.imagPart - yCube) < errorTolerance);
}

void complexCubeRootExample1(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> dataGenUniformHist(0.0001, 1.4999);
    long double xDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double yDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double xRetrieve, yRetrieve;
    customComplex zTarget, zCubeRootTarget, zRetrieve;
    zTarget.realPart = xDatum;
    zTarget.imagPart = yDatum;
    zCubeRootTarget = cubeRootComplex(zTarget);
    zRetrieve = cubeComplex(zCubeRootTarget);
    xRetrieve = zRetrieve.realPart;
    yRetrieve = zRetrieve.imagPart;
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(xRetrieve - xDatum) < errorTolerance);
    assert(fabs(yRetrieve - yDatum) < errorTolerance);
}

void complexCubeRootExample2(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> dataGenUniformHist(0.0001, 1.4999);
    long double xDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double yDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double xRetrieve, yRetrieve;
    customComplex zTarget, zCubeRootTarget, zRetrieve;
    zTarget.realPart = xDatum;
    zTarget.imagPart = yDatum;
    zCubeRootTarget = cubeRootComplex(zTarget);
    zRetrieve = cubeComplex(zCubeRootTarget);
    xRetrieve = zRetrieve.realPart;
    yRetrieve = zRetrieve.imagPart;
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(xRetrieve - xDatum) < errorTolerance);
    assert(fabs(yRetrieve - yDatum) < errorTolerance);
}

void complexCubeRootExample3(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> dataGenUniformHist(0.0001, 1.4999);
    long double xDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double yDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double xRetrieve, yRetrieve;
    customComplex zTarget, zCubeRootTarget, zRetrieve;
    zTarget.realPart = xDatum;
    zTarget.imagPart = yDatum;
    zCubeRootTarget = cubeRootComplex(zTarget);
    zRetrieve = cubeComplex(zCubeRootTarget);
    xRetrieve = zRetrieve.realPart;
    yRetrieve = zRetrieve.imagPart;
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(xRetrieve - xDatum) < errorTolerance);
    assert(fabs(yRetrieve - yDatum) < errorTolerance);
}

void complexCubeRootExample4(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> dataGenUniformHist(0.0001, 1.4999);
    long double xDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double yDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double xRetrieve, yRetrieve;
    customComplex zTarget, zCubeRootTarget, zRetrieve;
    zTarget.realPart = xDatum;
    zTarget.imagPart = yDatum;
    zCubeRootTarget = cubeRootComplex(zTarget);
    zRetrieve = cubeComplex(zCubeRootTarget);
    xRetrieve = zRetrieve.realPart;
    yRetrieve = zRetrieve.imagPart;
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(xRetrieve - xDatum) < errorTolerance);
    assert(fabs(yRetrieve - yDatum) < errorTolerance);
}

void complexCubeRootExample5(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> dataGenUniformHist(0.0001, 1.4999);
    long double xDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double yDatum = static_cast<long double>(dataGenUniformHist(merseenTwisterGen));
    long double xRetrieve, yRetrieve;
    customComplex zTarget, zCubeRootTarget, zRetrieve;
    zTarget.realPart = xDatum;
    zTarget.imagPart = yDatum;
    zCubeRootTarget = cubeRootComplex(zTarget);
    zRetrieve = cubeComplex(zCubeRootTarget);
    xRetrieve = zRetrieve.realPart;
    yRetrieve = zRetrieve.imagPart;
    long double errorTolerance = powf(10.0000, -12.0000);
    assert(fabs(xRetrieve - xDatum) < errorTolerance);
    assert(fabs(yRetrieve - yDatum) < errorTolerance);
}

void cubicEquationVerificationExample1(){
    random_device seedGen;
    mt19937 merseenTwisterGen(seedGen());
    uniform_real_distribution<> coeffRealRandomHistogram(0.0001, 9.9999);
    long double bReal, bImag, cReal, cImag;
    customComplex bCoeff, cCoeff;
    bReal = -5.0000 + coeffRealRandomHistogram(merseenTwisterGen);
    bImag = -5.0000 + coeffRealRandomHistogram(merseenTwisterGen);
    cReal = -5.0000 + coeffRealRandomHistogram(merseenTwisterGen);
    cImag = -5.0000 + coeffRealRandomHistogram(merseenTwisterGen);
    bCoeff.realPart = bReal;
    bCoeff.imagPart = bImag;
    cCoeff.realPart = cReal;
    cCoeff.imagPart = cImag;
    assert(cubicEquationRootMainVerifHandle(bCoeff, cCoeff));
}

int main(){
    squareComplexExample1();
    squareComplexExample2();
    squareComplexExample3();
    squareComplexExample4();
    squareRootExample1();
    squareRootExample2();
    squareRootExample3();
    squareRootExample4();
    squareRootExample5();
    complexCubeExample1();
    complexCubeExample2();
    complexCubeExample3();
    complexCubeRootExample1();
    complexCubeRootExample2();
    complexCubeRootExample3();
    complexCubeRootExample4();
    complexCubeRootExample5();
    cubicEquationVerificationExample1();
    return 0;
}