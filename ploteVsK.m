function ploteVsK(p, n)
%PLOTEVSK plot the E vs k diagram for the given p

cosFuncs = cell(1,n);
for i = 1:n
    cosFuncs{i} = genCosFunc(p, i);
end


xRange = -1:0.01:1;
plot(xRange, cosFuncs{1}(xRange))
hold on;
for i = 2:n
    plot(xRange, cosFuncs{i}(xRange))
end
hold off;

end

function cosFunc = genCosFunc(p, n)
    top = (findBandEdge(p, n, 'top')/pi)^2;
    bottom = (findBandEdge(p, n, 'bottom')/pi)^2;
    
    A = top - bottom;
    factor = -mod(n,2) * 2 + 1;
    
    cosFunc = @(x) factor*A/2*cos(pi*x) + bottom + A/2;
end