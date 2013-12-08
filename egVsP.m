m_0 = 9.10938;          % [kg] mass of electron
hbar = 1.054572e-34;    % [Js] reduced Planck constant
q = 1.602177e-19;       % [C] elementary charge

pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up
equArray = cell(1,arrayLen);
solveFunc = @(x) solve(x, 1.1*pi, 2*pi);
%solveFunc = makeSolveFunc(1.1*pi, 2*pi);
for i = 1:arrayLen
    equArray{i} = charEqu(pArray(i));
end
alphaAArray = cellfun(solveFunc, equArray);
alphaAArray = alphaAArray - pi;

%plot stuff
loglog(pArray, alphaAArray);
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
set(gca, 'XTickLabel',num2str(get(gca,'XTick')'));
set(gca, 'YLim', [4e-2, 4]);