# Problem53TAndreescuZFeng101ProblemsBook.jl

function objectiveFunction(x)
    return exp(x*log(2)) + exp(x*log(3)) + exp(x*log(6)) - x^2
end

function jacobianObjectiveFunction(x)
    return log(2)*exp(x*log(2)) + log(3)*exp(x*log(3)) + log(6)*exp(x*log(6)) - 2*x
end

xInit = -4.0000 # (converges to xFinal = -1.0000)
# xInit = 12.0000 (converges to xFinal = -1.0000)
# xInit = 3.5000 (converges to xFinal = -1.0000)
# xInit = -2.0000 (converges to xFinal = -1.0000)
xCurrent = xInit
xNext = 1.0001*xInit
objFuncEval = objectiveFunction(xCurrent)
jacobFuncEval = jacobianObjectiveFunction(xCurrent)
epsTolerance = 1.e-14
while abs(objFuncEval) > epsTolerance
    global xCurrent
    global xNext
    global objFuncEval
    global jacobFuncEval
    xCurrent = xNext
    objFuncEval = objectiveFunction(xCurrent)
    jacobFuncEval = jacobianObjectiveFunction(xCurrent)
    xNext = xCurrent - objFuncEval/jacobFuncEval
    println(
        string(
            "x = ",
            round(xCurrent, digits = 8),
            ":: |f(x)| = ",
            round(abs(objFuncEval))
        )
    )
end

println(string("xFinal = ", round(xNext, digits = 16)))