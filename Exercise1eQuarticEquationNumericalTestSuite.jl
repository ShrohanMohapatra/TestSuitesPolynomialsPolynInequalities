# Exercise1eQuarticEquationNumericalTestSuite.jl

include("Exercise1eQuarticEquationNumericalVerif.jl")

function testDepressedCubicRootExample1()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleDepressedCubicRoot(b, c)
end

function testDepressedCubicRootExample2()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleDepressedCubicRoot(b, c)
end

function testDepressedCubicRootExample3()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleDepressedCubicRoot(b, c)
end

function testDepressedCubicRootExample4()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleDepressedCubicRoot(b, c)
end

function testDepressedCubicRootExample5()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleDepressedCubicRoot(b, c)
end

function testActualCubicFunctionRootExample1()
    aReal = -2.5000 + 5.0000*rand()
    aImag = -2.5000 + 5.0000*rand()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleFullCubicRoot(a, b, c)
end

function testActualCubicFunctionRootExample2()
    aReal = -2.5000 + 5.0000*rand()
    aImag = -2.5000 + 5.0000*rand()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleFullCubicRoot(a, b, c)
end

function testActualCubicFunctionRootExample3()
    aReal = -2.5000 + 5.0000*rand()
    aImag = -2.5000 + 5.0000*rand()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleFullCubicRoot(a, b, c)
end

function testActualCubicFunctionRootExample4()
    aReal = -2.5000 + 5.0000*rand()
    aImag = -2.5000 + 5.0000*rand()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleFullCubicRoot(a, b, c)
end

function testActualCubicFunctionRootExample5()
    aReal = -2.5000 + 5.0000*rand()
    aImag = -2.5000 + 5.0000*rand()
    bReal = -2.5000 + 5.0000*rand()
    bImag = -2.5000 + 5.0000*rand()
    cReal = -2.5000 + 5.0000*rand()
    cImag = -2.5000 + 5.0000*rand()
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    testHandleFullCubicRoot(a, b, c)
end

function testActualComplexSquareExample1()
    aReal = -25.0000 + 50.0000*rand()
    aImag = -25.0000 + 50.0000*rand()
    a = aReal + 1im*aImag
    z = complexSquareRoot(a)
    zReal = real(z)
    zImag = imag(z)
    @assert round(abs(zReal^2 - zImag^2 - aReal)) < 1.e-12
    @assert round(abs(2*zReal*zImag - aImag)) < 1.e-12
end

function testActualComplexSquareExample2()
    aReal = -25.0000 + 50.0000*rand()
    aImag = -25.0000 + 50.0000*rand()
    a = aReal + 1im*aImag
    z = complexSquareRoot(a)
    zReal = real(z)
    zImag = imag(z)
    @assert round(abs(zReal^2 - zImag^2 - aReal)) < 1.e-12
    @assert round(abs(2*zReal*zImag - aImag)) < 1.e-12
end

function testActualComplexSquareExample3()
    aReal = -25.0000 + 50.0000*rand()
    aImag = -25.0000 + 50.0000*rand()
    a = aReal + 1im*aImag
    z = complexSquareRoot(a)
    zReal = real(z)
    zImag = imag(z)
    @assert round(abs(zReal^2 - zImag^2 - aReal)) < 1.e-12
    @assert round(abs(2*zReal*zImag - aImag)) < 1.e-12
end

function testActualComplexSquareExample4()
    aReal = -25.0000 + 50.0000*rand()
    aImag = -25.0000 + 50.0000*rand()
    a = aReal + 1im*aImag
    z = complexSquareRoot(a)
    zReal = real(z)
    zImag = imag(z)
    @assert round(abs(zReal^2 - zImag^2 - aReal)) < 1.e-12
    @assert round(abs(2*zReal*zImag - aImag)) < 1.e-12
end

function testActualComplexSquareExample5()
    aReal = -25.0000 + 50.0000*rand()
    aImag = -25.0000 + 50.0000*rand()
    a = aReal + 1im*aImag
    z = complexSquareRoot(a)
    zReal = real(z)
    zImag = imag(z)
    @assert abs(zReal^2 - zImag^2 - aReal) < 1.e-12
    @assert abs(2*zReal*zImag - aImag) < 1.e-12
end

function testFundamentalComplexSquareExample1()
    zReal = -25.0000 + 50.0000*rand()
    zImag = -25.0000 + 50.0000*rand()
    z = zReal + 1im*zImag
    zSquare = fundamentalComplexSquare(z)
    zSqReal = real(zSquare)
    zSqImag = imag(zSquare)
    @assert abs(zSqReal - zReal^2 + zImag^2) < 1.e-12
    @assert abs(zSqImag - 2*zReal*zImag) < 1.e-12
end

function testFundamentalComplexSquareExample2()
    zReal = 4.0000
    zImag = 3.0000
    z = zReal + 1im*zImag
    zSquare = fundamentalComplexSquare(z)
    zSqReal = 7.00000
    zSqImag = 24.0000
    @assert abs(zSqReal - zReal^2 + zImag^2) < 1.e-12
    @assert abs(zSqImag - 2*zReal*zImag) < 1.e-12
end

function testFundamentalComplexSquareExample3()
    zReal = 3.0000
    zImag = 4.0000
    z = zReal + 1im*zImag
    zSquare = fundamentalComplexSquare(z)
    zSqReal = -7.00000
    zSqImag = 24.0000
    @assert abs(zSqReal - zReal^2 + zImag^2) < 1.e-12
    @assert abs(zSqImag - 2*zReal*zImag) < 1.e-12
end

function testFundamentalComplexSquareExample4()
    zReal = 4.0000
    zImag = -3.0000
    z = zReal + 1im*zImag
    zSquare = fundamentalComplexSquare(z)
    zSqReal = 7.00000
    zSqImag = -24.0000
    @assert abs(zSqReal - zReal^2 + zImag^2) < 1.e-12
    @assert abs(zSqImag - 2*zReal*zImag) < 1.e-12
end

function testFundamentalComplexSquareExample5()
    zReal = 4.0000
    zImag = 2.0000
    z = zReal + 1im*zImag
    zSquare = fundamentalComplexSquare(z)
    zSqReal = 12.00000
    zSqImag = 16.0000
    @assert abs(zSqReal - zReal^2 + zImag^2) < 1.e-12
    @assert abs(zSqImag - 2*zReal*zImag) < 1.e-12
end

function testActualQuarticFunctionExample1()
    # #############################################
    aReal = -2.5000 + 5.0000*rand()
    aImag = 0.0000 + 0.0000im # -2.5000 + 5.0000*rand()
    # #############################################
    bReal = -2.5000 + 5.0000*rand()
    bImag = 0.0000 + 0.0000im # -2.5000 + 5.0000*rand()
    # #############################################
    cReal = -2.5000 + 5.0000*rand()
    cImag = 0.0000 + 0.0000im # -2.5000 + 5.0000*rand()
    # #############################################
    dReal = -2.5000 + 5.0000*rand()
    dImag = 0.0000 + 0.0000im # -2.5000 + 5.0000*rand()
    # #############################################
    a = aReal + 1im*aImag
    b = bReal + 1im*bImag
    c = cReal + 1im*cImag
    d = dReal + 1im*dImag
    actualQuarticFunctionRoots(a, b, c, d)
end

testDepressedCubicRootExample1()
testDepressedCubicRootExample2()
testDepressedCubicRootExample3()
testDepressedCubicRootExample4()
testDepressedCubicRootExample5()

testActualCubicFunctionRootExample1()
testActualCubicFunctionRootExample2()
testActualCubicFunctionRootExample3()
testActualCubicFunctionRootExample4()
testActualCubicFunctionRootExample5()

testActualComplexSquareExample1()
testActualComplexSquareExample2()
testActualComplexSquareExample3()
testActualComplexSquareExample4()
testActualComplexSquareExample5()

testFundamentalComplexSquareExample1()
testFundamentalComplexSquareExample2()
testFundamentalComplexSquareExample3()
testFundamentalComplexSquareExample4()
testFundamentalComplexSquareExample5()

testActualQuarticFunctionExample1()
