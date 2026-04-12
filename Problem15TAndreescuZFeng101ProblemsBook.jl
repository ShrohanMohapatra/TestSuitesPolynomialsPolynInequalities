# Problem15TAndreescuZFeng101ProblemsBook.jl

function objectiveFunction(x)
    return exp(x*log(10)) + exp(x*log(11)) + exp(x*log(12)) - exp(x*log(13)) - exp(x*log(14))
end

function jacobianObjectiveFunction(x)
    return log(10)*exp(x*log(10)) + log(11)*exp(x*log(11)) + log(12)*exp(x*log(12)) - log(13)*exp(x*log(13)) - log(14)*exp(x*log(14))
end

xInit = 3.5000
# xInit = 0.05 (intends to speed fast towards -inf)
# xInit = 1.9000 (converges to 2.0000) # xInit =  5.0000 (converges to 2.0000)
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