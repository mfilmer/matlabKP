m_0 = 9.10938;          % [kg] mass of electron
hbar = 1.054572e-34;    % [Js] reduced Planck constant
q = 1.602177e-19;       % [C] elementary charge

pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up
solveFunc = @(p) findBandEdge(p, 2, 'bottom');
alphaAArray = arrayfun(solveFunc, pArray);
alphaAArray = alphaAArray - pi;

%plot egVsP
loglog(pArray, alphaAArray);
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
set(gca, 'XTickLabel',num2str(get(gca,'XTick')'));
set(gca, 'YLim', [4e-2, 4]);