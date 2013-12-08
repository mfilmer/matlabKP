m_0 = 9.10938;          % [kg] mass of electron
hbar = 1.054572e-34;    % [Js] reduced Planck constant
q = 1.602177e-19;       % [C] elementary charge

bandGap = cell(1,3);

pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up

for i = 1:10
    solveFunc = @(p) findBandEdge(p, i+1, 'bottom');
    alphaAArray = arrayfun(solveFunc, pArray);
    bandGap{i} = alphaAArray - pi*i;
end

%plot egVsP
loglog(pArray, bandGap{1})
hold on;
for i = 2:10
    plot(pArray, bandGap{i});
end
hold off;
set(gca, 'YLim', [4e-2, 4]);
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
set(gca, 'XTickLabel',num2str(get(gca,'XTick')'));
xlabel('P')
ylabel('Eg')
