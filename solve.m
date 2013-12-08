function solution = solve(inFunc, varargin)
%SOLVE solve an equation using Newton's Method

switch nargin
    case 2
        x = varargin{1};
    case 3
        x = genGuess(inFunc, varargin{1}, varargin{2});
    otherwise
        raise exception
end
        
for i = 1:100
    m = getSlope(inFunc, x);
    x = (m*x - inFunc(x))/m;
end
solution = x;
end

function slope = getSlope(inFunc, x)
%SLOPE calculate the slope at a given point
inc = 1e-5;
if x ~= 0
    inc = inc * x;
end

slope = (inFunc(x + inc) - inFunc(x - inc))/(2*inc);
end

function guess = genGuess(inFunc, start, stop)
%GENGUESS get an initial guess to the solution
xValues = linspace(start, stop, 101);
funcVals = abs(arrayfun(inFunc, xValues));
[~, minIndex] = min(funcVals);
guess = xValues(minIndex);
end