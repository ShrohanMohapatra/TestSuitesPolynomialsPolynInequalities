# Problem26TAndreescuZFeng101ProblemsBook.jl

function objectiveFunction(x)
    return exp(x*log(2)) + exp(x*log(3)) - exp(2*x*log(2)) + exp(x*log(6)) - exp(2*x*log(3)) - 1
end

function jacobianObjectiveFunction(x)
    return log(2)*exp(x*log(2)) + log(3)*exp(x*log(3)) - 2*log(2)*exp(2*x*log(2)) + log(6)*exp(x*log(6)) - 2*log(3)*exp(2*x*log(3))
end

xInitialGuess = 2.0000 # 0.950
xCurrent = xInitialGuess
xNext = 1.005*xInitialGuess
objFuncEval = objectiveFunction(xCurrent)
jacobFuncEval = jacobianObjectiveFunction(xCurrent)
epsilonTolerance = 1.e-14
println(string("x = ", xCurrent, "; |f(x)| = ", abs(objFuncEval)))
while abs(objFuncEval) >= epsilonTolerance
    global xCurrent
    global xNext
    global objFuncEval
    global jacobFuncEval
    println(string("x = ", xCurrent, "; |f(x)| = ", abs(objFuncEval)))
    xCurrent = xNext
    objFuncEval = objectiveFunction(xCurrent)
    jacobFuncEval = jacobianObjectiveFunction(xCurrent)
    xNext = xCurrent - objFuncEval/jacobFuncEval
end

println(string("xFinal = ", xCurrent))