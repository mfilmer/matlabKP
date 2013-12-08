function sFunc = makeSolveFunc(start, stop)
%MAKESOLVEFUNC return a function that solves an equation
sFunc = @(func) solve(func, start, stop);
end

