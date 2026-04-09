// Exercise1aQuadraticEquationVerification.cpp

#include<cassert>
#include<cmath>
#include<random>

using namespace std;

bool quadraticEqnExample1(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    b = -7.0000;
    c = 12.0000;
    x1 = 3.0000;
    x2 = 4.0000;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = fabs(x1 - xRoot1) < powf(10.000, -16.0000) && fabs(x2 - xRoot2) < powf(10.000, -16.0000);
    return verifFlag;
}

bool quadraticEqnExample2(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    b = -14.0000;
    c = 33.0000;
    x1 = 3.0000;
    x2 = 11.0000;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = fabs(x1 - xRoot1) < powf(10.000, -16.0000) && fabs(x2 - xRoot2) < powf(10.000, -16.0000);
    return verifFlag;
}

bool quadraticEqnExample3(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    b = 4.0000;
    c = -21.0000;
    x1 = -7.0000;
    x2 = 3.0000;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = fabs(x1 - xRoot1) < powf(10.000, -16.0000) && fabs(x2 - xRoot2) < powf(10.000, -16.0000);
    return verifFlag;
}

bool quadraticEqnExample4(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    b = 11.0000;
    c = 30.0000;
    x1 = -6.0000;
    x2 = -5.0000;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = fabs(x1 - xRoot1) < powf(10.000, -16.0000) && fabs(x2 - xRoot2) < powf(10.000, -16.0000);
    return verifFlag;
}

bool quadraticEqnExample5(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformRealHistogram(5.0000, 150.0000);
    x1 = uniformRealHistogram(gen);
    x2 = uniformRealHistogram(gen);
    b = -x1 - x2;
    c = x1*x2;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = (fabs(x1 - xRoot1) < powf(10.000, -6.0000) && fabs(x2 - xRoot2) < powf(10.000, -6.0000)) || (fabs(x1 - xRoot2) < powf(10.000, -6.0000) && fabs(x2 - xRoot1) < powf(10.000, -6.0000));
    return verifFlag;
}

bool quadraticEqnExample6(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformRealHistogram1(5.0000, 150.0000);
    uniform_real_distribution<> uniformRealHistogram2(-5.0000, -150.0000);
    x1 = uniformRealHistogram1(gen);
    x2 = uniformRealHistogram2(gen);
    b = -x1 - x2;
    c = x1*x2;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = (fabs(x1 - xRoot1) < powf(10.000, -4.0000) && fabs(x2 - xRoot2) < powf(10.000, -4.0000)) || (fabs(x1 - xRoot2) < powf(10.000, -4.0000) && fabs(x2 - xRoot1) < powf(10.000, -4.0000));
    return verifFlag;
}

bool quadraticEqnExample7(){
    long double x1, x2, b, c, xRoot1, xRoot2;
    random_device rd;
    mt19937 gen(rd());
    uniform_real_distribution<> uniformRealHistogram(-5.0000, -150.0000);
    x1 = uniformRealHistogram(gen);
    x2 = uniformRealHistogram(gen);
    b = -x1 - x2;
    c = x1*x2;
    xRoot1 = (-b-powf(b*b-4*c, 0.5000))/2;
    xRoot2 = (-b+powf(b*b-4*c, 0.5000))/2;
    bool verifFlag = (fabs(x1 - xRoot1) < powf(10.000, -4.0000) && fabs(x2 - xRoot2) < powf(10.000, -4.0000)) || (fabs(x1 - xRoot2) < powf(10.000, -4.0000) && fabs(x2 - xRoot1) < powf(10.000, -4.0000));
    return verifFlag;
}

int main(){
    assert(quadraticEqnExample1());
    assert(quadraticEqnExample2());
    assert(quadraticEqnExample3());
    assert(quadraticEqnExample4());
    assert(quadraticEqnExample5());
    assert(quadraticEqnExample6());
    assert(quadraticEqnExample7());
    return 0;
}