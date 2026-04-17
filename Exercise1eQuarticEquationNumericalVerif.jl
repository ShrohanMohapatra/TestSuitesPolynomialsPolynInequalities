# Exercise1eQuarticEquationNumericalVerif.jl

using LinearAlgebra

function depressedCubicRootInitialGuess(b, c)
    bReal = real(b)
    bImag = imag(b)
    cReal = real(c)
    cImag = imag(c)
    deltaReal = (cReal^2 - cImag^2)/4 + (bReal^3 - 3*bReal*bImag^2)/27
    deltaImag = cReal*cImag/2 + (3*bReal^2*bImag - bImag^3)/27
    phiSqrt = 1/2*atan(deltaImag, deltaReal)
    deltaSqrt = (deltaReal^2 + deltaImag^2)^(1.0000/4.0000)*(cos(phiSqrt) + 1im*sin(phiSqrt))
    alphaCube = -1/2*c + deltaSqrt
    betaCube = -1/2*c - deltaSqrt
    alphaCubeReal = real(alphaCube)
    alphaCubeImag = imag(alphaCube)
    betaCubeReal = real(betaCube)
    betaCubeImag = imag(betaCube)
    phiAlpha = 2/3*atan(alphaCubeImag, alphaCubeReal)
    phiBeta = 2/3*atan(betaCubeImag, betaCubeReal)
    alphaVal = (alphaCubeReal^2 + alphaCubeImag^2)^(1.0000/6.0000)*(cos(phiAlpha) + 1im*sin(phiAlpha))
    betaVal = (betaCubeReal^2 + betaCubeImag^2)^(1.0000/6.0000)*(cos(phiBeta) + 1im*sin(phiBeta))
    vecOfRoots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    alphaPlusBeta = alphaVal + betaVal
    alphaMinusBeta = alphaVal - betaVal
    vecOfRoots[1] = alphaPlusBeta
    vecOfRoots[2] = -alphaPlusBeta/2 + 1im*sqrt(3)*alphaMinusBeta/2
    vecOfRoots[3] = -alphaPlusBeta/2 - 1im*sqrt(3)*alphaMinusBeta/2
    return vecOfRoots
end

function realOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return x^3 - 3*x*y^2 + bReal*x - bImag*y + cReal
end

function imagOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return 3*x^2*y - y^3 + bImag*x + bReal*y + cImag
end

function vecOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return [
        realOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag);
        imagOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
        ]
end

function jacobianMatrixOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return [
        [3*x^2-3*y^2+bReal -6*x*y-bImag];
        [6*x*y+bImag 3*x^2-3*y^2+bReal]
    ]
end

function jacobianInvMatrixOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    detMatrix = (3*x^2-3*y^3+bReal)^2 + (6*x*y + bImag)^2;
    a = (3*x^2-3*y^2+bReal)/detMatrix;
    b = (6*x*y+bImag)/detMatrix;
    return [[a b]; [-b a]]
end

function depressedCubicRootNewtonIteration(zInitGuess, bCoeff, cCoeff)
    xInitGuess = real(zInitGuess)
    yInitGuess = imag(zInitGuess)
    vecCurrent = [xInitGuess; yInitGuess]
    vecNext = [1.005*xInitGuess; 1.005*yInitGuess]
    bReal = real(bCoeff)
    bImag = imag(bCoeff)
    cReal = real(cCoeff)
    cImag = imag(cCoeff)
    fCurrent = vecOrigCubicPolyn(vecCurrent[1], vecCurrent[2], bReal, bImag, cReal, cImag)
    while norm(fCurrent) >= 1.e-12
        vecCurrent = vecNext
        fCurrent = vecOrigCubicPolyn(
                    vecCurrent[1], vecCurrent[2],
                    bReal, bImag,
                    cReal, cImag
                    )
        invJacobMat = jacobianInvMatrixOrigCubicPolyn(
                        vecCurrent[1], vecCurrent[2],
                        bReal, bImag,
                        cReal, cImag
                        )
        vecNext = vecCurrent .- invJacobMat*fCurrent
    end
    return vecNext[1] + vecNext[2]*1im
end

function depressedCubicFunction(z, b, c)
    f = z^3 + b*z + c
    fReal = real(f)
    fImag = imag(f)
    return sqrt(fReal^2 + fImag^2)
end

function testHandleDepressedCubicRoot(b, c)
    vecOfInitialGuesses = depressedCubicRootInitialGuess(b, c)
    vecOfRoots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    vecOfRoots[1] = depressedCubicRootNewtonIteration(vecOfInitialGuesses[1], b, c)
    vecOfRoots[2] = depressedCubicRootNewtonIteration(vecOfInitialGuesses[2], b, c)
    vecOfRoots[3] = depressedCubicRootNewtonIteration(vecOfInitialGuesses[3], b, c)
    @assert depressedCubicFunction(vecOfRoots[1], b, c) < 1.e-12
    @assert depressedCubicFunction(vecOfRoots[2], b, c) < 1.e-12
    @assert depressedCubicFunction(vecOfRoots[3], b, c) < 1.e-12
end

function actualCubicFunction(z, a, b, c)
    f = z^3 + a*z^2 + b*z + c
    fReal = real(f)
    fImag = imag(f)
    return sqrt(fReal^2 + fImag^2)
end

function actualCubicFunctionRoots(a, b, c)
    g = -a/3
    bDepressed = 3*g^2 + 2*a*g + b
    cDepressed = g^3 + a*g^2 + b*g + c
    vecOfWinitGuesses = depressedCubicRootInitialGuess(bDepressed, cDepressed)
    vecOfWroots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    vecOfZroots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    vecOfWroots[1] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[1], bDepressed, cDepressed)
    vecOfWroots[2] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[2], bDepressed, cDepressed)
    vecOfWroots[3] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[3], bDepressed, cDepressed)
    vecOfZroots[1] = vecOfWroots[1] + g
    vecOfZroots[2] = vecOfWroots[2] + g
    vecOfZroots[3] = vecOfWroots[3] + g
    return vecOfZroots
end

function testHandleFullCubicRoot(a, b, c)
    vecOfRoots = actualCubicFunctionRoots(a, b, c)
    @assert abs(actualCubicFunction(vecOfRoots[1], a, b, c)) < 1.e-12
    @assert abs(actualCubicFunction(vecOfRoots[2], a, b, c)) < 1.e-12
    @assert abs(actualCubicFunction(vecOfRoots[3], a, b, c)) < 1.e-12
end

function complexSquareRoot(z)
    zReal = real(z)
    zImag = imag(z)
    phiSqrt = 1/2*atan(zImag, zReal)
    zSqrt = (zReal^2 + zImag^2)^(1/4)*(cos(phiSqrt) + 1im*sin(phiSqrt))
    return zSqrt
end

function fundamentalComplexSquare(z)
    return z^2
end

function actualQuarticFunctionRoots(a, b, c, d)
    aModified = a + (-1.e-5 + 2.e-5*rand()) + 1im*(-1.e-5 + 2.e-5*rand())
    bModified = b + (-1.e-5 + 2.e-5*rand()) + 1im*(-1.e-5 + 2.e-5*rand())
    cModified = c + (-1.e-5 + 2.e-5*rand()) + 1im*(-1.e-5 + 2.e-5*rand())
    dModified = d + (-1.e-5 + 2.e-5*rand()) + 1im*(-1.e-5 + 2.e-5*rand())
    aNew = -bModified
    bNew = aModified*cModified + 4*dModified
    cNew = 4*bModified*dModified - aModified^2*dModified - cModified^2
    gNew = -aNew/3
    bDepressed = 3*gNew^2 + 2*aNew*gNew + bNew
    cDepressed = gNew^3 + aNew*gNew^2 + bNew*gNew + cNew
    vecOfWinitGuesses = depressedCubicRootInitialGuess(bDepressed, cDepressed)
    vecOfWroots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    vecOfYroots = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    vecOfWroots[1] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[1], bDepressed, cDepressed)
    vecOfWroots[2] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[2], bDepressed, cDepressed)
    vecOfWroots[3] = depressedCubicRootNewtonIteration(vecOfWinitGuesses[3], bDepressed, cDepressed)
    vecOfYroots[1] = vecOfWroots[1] + gNew
    vecOfYroots[2] = vecOfWroots[2] + gNew
    vecOfYroots[3] = vecOfWroots[3] + gNew
    vecR = zeros(Float64, 1, 3) + 1im*zeros(Float64, 1, 3)
    for k = 1:3
        Rsquared = aModified^2/4 - bModified + vecOfYroots[k]
        RsquaredReal = real(Rsquared)
        RsquaredImag = imag(Rsquared)
        phiR = 1/2*atan(RsquaredImag, RsquaredReal)
        vecR[k] = sqrt(sqrt(RsquaredReal^2 + RsquaredImag^2))*(cos(phiR) + 1im*sin(phiR))
    end
    println(string("R1 = ", vecR[1]))
    println(string("R2 = ", vecR[2]))
    println(string("R3 = ", vecR[3]))
end

