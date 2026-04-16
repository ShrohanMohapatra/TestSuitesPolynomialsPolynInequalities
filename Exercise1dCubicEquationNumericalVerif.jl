# Exercise1dCubicEquationNumericalVerif.jl

using Test
using LinearAlgebra

function realOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return x*(x*x - 3*y*y + bReal) - bImag*y + cReal
end

function imagOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return y*(3*x*x - y*y + bImag) + bReal*y + cImag
end

function vecOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return [
        realOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag);
        imagOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
        ]
end

function jacobianMatrixOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    return [
        [3*x*x-3*y*y+bReal -6*x*y-bImag];
        [6*x*y+bImag 3*x*x-3*y*y+bReal]
    ]
end

function jacobianInvMatrixOrigCubicPolyn(x, y, bReal, bImag, cReal, cImag)
    detMatrix = (3*x*x-3*y*y+bReal)^2 + (6*x*y + bImag)^2;
    a = (3*x*x-3*y*y+bReal)/detMatrix;
    b = (6*x*y+bImag)/detMatrix;
    return [[a b]; [-b a]]
end

function rootConvergeNewtonIter(zInitGuess, bCoeff, cCoeff)
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

function cubicPolynTestExample1()
    bCoeff = 0.0000 + 0.0000im
    cCoeff = -27.0000 + 0.0000im
    zTest = 3.0000 + 0.0000im
    @test abs(realOrigCubicPolyn(
        real(zTest), imag(zTest),
        real(bCoeff), imag(bCoeff),
        real(cCoeff), imag(cCoeff)
        )) < 1.e-12
    @test abs(imagOrigCubicPolyn(
        real(zTest), imag(zTest),
        real(bCoeff), imag(bCoeff),
        real(cCoeff), imag(cCoeff)
        )) < 1.e-12
end

function cubicPolynTestExample2()
    bCoeff = 0.0000 + 0.0000im
    cCoeff = -27.0000 + 0.0000im
    zTest = 3.0000 + 4.0000im
    @test abs(realOrigCubicPolyn(
        real(zTest), imag(zTest),
        real(bCoeff), imag(bCoeff),
        real(cCoeff), imag(cCoeff)
        )) >= 1.e-12
    @test abs(imagOrigCubicPolyn(
        real(zTest), imag(zTest),
        real(bCoeff), imag(bCoeff),
        real(cCoeff), imag(cCoeff)
        )) >= 1.e-12
end

function matrixInvCheckExample1()
    x = rand(); y = rand();
    bR = rand(); bI = rand();
    cR = rand(); cI = rand();
    M = jacobianMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    Minv = jacobianInvMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    idMat = [[1.0000 0.0000]; [0.0000 1.0000]];
    @test norm(M*Minv -idMat) < 1.e-14
    @test norm(Minv*M -idMat) < 1.e-14
end

function matrixInvCheckExample2()
    x = rand(); y = rand();
    bR = rand(); bI = rand();
    cR = rand(); cI = rand();
    M = jacobianMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    Minv = jacobianInvMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    idMat = [[1.0000 0.0000]; [0.0000 1.0000]];
    @test norm(M*Minv -idMat) < 1.e-14
    @test norm(Minv*M -idMat) < 1.e-14
end

function matrixInvCheckExample3()
    x = rand(); y = rand();
    bR = rand(); bI = rand();
    cR = rand(); cI = rand();
    M = jacobianMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    Minv = jacobianInvMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    idMat = [[1.0000 0.0000]; [0.0000 1.0000]];
    @test norm(M*Minv -idMat) < 1.e-14
    @test norm(Minv*M -idMat) < 1.e-14
end

function matrixInvCheckExample4()
    x = rand(); y = rand();
    bR = rand(); bI = rand();
    cR = rand(); cI = rand();
    M = jacobianMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    Minv = jacobianInvMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    idMat = [[1.0000 0.0000]; [0.0000 1.0000]];
    @test norm(M*Minv -idMat) < 1.e-14
    @test norm(Minv*M -idMat) < 1.e-14
end

function matrixInvCheckExample5()
    x = rand(); y = rand();
    bR = rand(); bI = rand();
    cR = rand(); cI = rand();
    M = jacobianMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    Minv = jacobianInvMatrixOrigCubicPolyn(x, y, bR, bI, cR, cI);
    idMat = [[1.0000 0.0000]; [0.0000 1.0000]];
    @test norm(M*Minv -idMat) < 1.e-14
    @test norm(Minv*M -idMat) < 1.e-14
end

function rootCheckExample1()
    bCoeff = -7.0000 + 0.0000im
    cCoeff = 6.0000 + 0.0000im
    zInitGuess = 0.99995 + 0.00005im
    @test abs(rootConvergeNewtonIter(zInitGuess, bCoeff, cCoeff) - 1.0000) < 1.e-12
end

function rootCheckExample2()
    bCoeff = -7.0000 + 0.0000im
    cCoeff = 6.0000 + 0.0000im
    zInitGuess = 0.99995 + 0.00005im
    @test abs(rootConvergeNewtonIter(zInitGuess, bCoeff, cCoeff) - 1.0000) < 1.e-12
end

function rootCheckExample3()
    bCoeff = -7.0000 + 0.0000im
    cCoeff = 6.0000 + 0.0000im
    zInitGuess = -2.99995 + 0.00005im
    @test abs(rootConvergeNewtonIter(zInitGuess, bCoeff, cCoeff) + 3.0000) < 1.e-12
end

function rootNewtonsCheckExample1()
    bReal = 10.0000*rand()
    bImag = 10.0000*rand()
    cReal = 10.0000*rand()
    cImag = 10.0000*rand()
    bCoeff = bReal + 1im*bImag
    cCoeff = cReal + 1im*cImag
    numberOfInitialGuesses = 100
    vecInitialGuesses = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalConvergentRoots = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalRoots = Vector{Float64}() + 1im*Vector{Float64}()
    for k = 1:1:numberOfInitialGuesses
        vecInitialGuesses[k] = 10.0000*rand() + 1im*10.0000*rand()
    end
    for k = 1:1:numberOfInitialGuesses
        vecFinalConvergentRoots[k] = rootConvergeNewtonIter(vecInitialGuesses[k], bCoeff, cCoeff)
    end
    for k = 1:1:numberOfInitialGuesses
        lengthOfFinalConvergentRoots = length(vecFinalRoots)
        flagFinalConvergent = false
        for m = 1:1:lengthOfFinalConvergentRoots
            flagFinalConvergent = flagFinalConvergent || abs(vecFinalRoots[m] - vecFinalConvergentRoots[k]) < 1.e-5
            if flagFinalConvergent
                break
            end
        end
        if flagFinalConvergent == false
            push!(vecFinalRoots, vecFinalConvergentRoots[k])
        end
    end
    lengthOfFinalConvergentRoots = length(vecFinalRoots)
    println("-------------------------------------------------------------")
    println("Example 1:")
    println("-------------------------------------------------------------")
    println(string("b = ", bCoeff, ":"))
    println(string("c = ", cCoeff, ":"))
    println("-------------------------------------------------------------")
    for m = 1:1:lengthOfFinalConvergentRoots
        println(string("vecFinalRoots[", m, "] = ", vecFinalRoots[m]))
    end
    println("-------------------------------------------------------------")
end

function rootNewtonsCheckExample2()
    cReal = -5.0000 + 10.0000*rand()
    cImag = 0.0000
    cCoeff = cReal + 1im*cImag
    epsMod = 0.0500*rand()
    epsilon = epsMod + 1im*0.0000
    delta = 27*cCoeff^2 + epsilon
    bCoeff = (1.0000/4.0000*(delta - 27*cCoeff^2))^(1.0000/3.0000)
    numberOfInitialGuesses = 100
    vecInitialGuesses = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalConvergentRoots = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalRoots = Vector{Float64}() + 1im*Vector{Float64}()
    for k = 1:1:numberOfInitialGuesses
        vecInitialGuesses[k] = 10.0000*rand() + 1im*10.0000*rand()
    end
    for k = 1:1:numberOfInitialGuesses
        vecFinalConvergentRoots[k] = rootConvergeNewtonIter(vecInitialGuesses[k], bCoeff, cCoeff)
    end
    for k = 1:1:numberOfInitialGuesses
        lengthOfFinalConvergentRoots = length(vecFinalRoots)
        flagFinalConvergent = false
        for m = 1:1:lengthOfFinalConvergentRoots
            flagFinalConvergent = flagFinalConvergent || abs(vecFinalRoots[m] - vecFinalConvergentRoots[k]) < 1.e-5
            if flagFinalConvergent
                break
            end
        end
        if flagFinalConvergent == false
            push!(vecFinalRoots, vecFinalConvergentRoots[k])
        end
    end
    lengthOfFinalConvergentRoots = length(vecFinalRoots)
    println("-------------------------------------------------------------")
    println("Example 2:")
    println("-------------------------------------------------------------")
    println(string("b = ", bCoeff, ":"))
    println(string("c = ", cCoeff, ":"))
    println(string("Delta = ", 4*bCoeff^3+27*cCoeff^2, ":"))
    println("-------------------------------------------------------------")
    for m = 1:1:lengthOfFinalConvergentRoots
        println(string("vecFinalRoots[", m, "] = ", vecFinalRoots[m]))
    end
    println("-------------------------------------------------------------")
end

function rootNewtonsCheckExample3()
    cReal = -5.0000 + 10.0000*rand()
    cImag = 0.0000
    cCoeff = cReal + 1im*cImag
    epsMod = 0.0500*rand()
    epsilon = epsMod + 1im*0.0000
    delta = 27*cCoeff^2 - epsilon
    bCoeff = -(1.0000/4.0000*(27*cCoeff^2 - epsilon))^(1.0000/3.0000)
    numberOfInitialGuesses = 100
    vecInitialGuesses = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalConvergentRoots = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalRoots = Vector{Float64}() + 1im*Vector{Float64}()
    for k = 1:1:numberOfInitialGuesses
        vecInitialGuesses[k] = 10.0000*rand() + 1im*10.0000*rand()
    end
    for k = 1:1:numberOfInitialGuesses
        vecFinalConvergentRoots[k] = rootConvergeNewtonIter(vecInitialGuesses[k], bCoeff, cCoeff)
    end
    for k = 1:1:numberOfInitialGuesses
        lengthOfFinalConvergentRoots = length(vecFinalRoots)
        flagFinalConvergent = false
        for m = 1:1:lengthOfFinalConvergentRoots
            flagFinalConvergent = flagFinalConvergent || abs(vecFinalRoots[m] - vecFinalConvergentRoots[k]) < 1.e-5
            if flagFinalConvergent
                break
            end
        end
        if flagFinalConvergent == false
            push!(vecFinalRoots, vecFinalConvergentRoots[k])
        end
    end
    lengthOfFinalConvergentRoots = length(vecFinalRoots)
    println("-------------------------------------------------------------")
    println("Example 3:")
    println("-------------------------------------------------------------")
    println(string("b = ", bCoeff, ":"))
    println(string("c = ", cCoeff, ":"))
    println(string("Delta = ", 4*bCoeff^3+27*cCoeff^2, ":"))
    println("-------------------------------------------------------------")
    for m = 1:1:lengthOfFinalConvergentRoots
        println(string("vecFinalRoots[", m, "] = ", vecFinalRoots[m]))
    end
    println("-------------------------------------------------------------")
end

function rootNewtonsCheckExample4()
    cReal = -5.0000 + 10.0000*rand()
    cImag = 0.0000
    cCoeff = cReal + 1im*cImag
    epsMod = 0.0500*rand()
    delta = -5.0000 + 10.0000*rand()
    bCoeff = -(1.0000/4.0000*(delta + 27*cCoeff^2))^(1.0000/3.0000)
    numberOfInitialGuesses = 100
    vecInitialGuesses = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalConvergentRoots = rand(Float64, 1, numberOfInitialGuesses) + 1im*rand(Float64, 1, numberOfInitialGuesses)
    vecFinalRoots = Vector{Float64}() + 1im*Vector{Float64}()
    for k = 1:1:numberOfInitialGuesses
        vecInitialGuesses[k] = 10.0000*rand() + 1im*10.0000*rand()
    end
    for k = 1:1:numberOfInitialGuesses
        vecFinalConvergentRoots[k] = rootConvergeNewtonIter(vecInitialGuesses[k], bCoeff, cCoeff)
    end
    for k = 1:1:numberOfInitialGuesses
        lengthOfFinalConvergentRoots = length(vecFinalRoots)
        flagFinalConvergent = false
        for m = 1:1:lengthOfFinalConvergentRoots
            flagFinalConvergent = flagFinalConvergent || abs(vecFinalRoots[m] - vecFinalConvergentRoots[k]) < 1.e-5
            if flagFinalConvergent
                break
            end
        end
        if flagFinalConvergent == false
            push!(vecFinalRoots, vecFinalConvergentRoots[k])
        end
    end
    lengthOfFinalConvergentRoots = length(vecFinalRoots)
    println("-------------------------------------------------------------")
    println("Example 4:")
    println("-------------------------------------------------------------")
    println(string("b = ", bCoeff, ":"))
    println(string("c = ", cCoeff, ":"))
    println(string("Delta = ", 4*bCoeff^3+27*cCoeff^2, ":"))
    println("-------------------------------------------------------------")
    for m = 1:1:lengthOfFinalConvergentRoots
        println(string("vecFinalRoots[", m, "] = ", vecFinalRoots[m]))
    end
    println("-------------------------------------------------------------")
end

cubicPolynTestExample1()
cubicPolynTestExample2()
matrixInvCheckExample1()
matrixInvCheckExample2()
matrixInvCheckExample3()
matrixInvCheckExample4()
matrixInvCheckExample5()
rootCheckExample1()
rootCheckExample2()
rootCheckExample3()
rootNewtonsCheckExample1()
rootNewtonsCheckExample2()
rootNewtonsCheckExample3()
rootNewtonsCheckExample4()
