
%calculate egVsP
gapsToCalculate = 10;
bandGap = cell(1,gapsToCalculate);
pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up

for n = 1:gapsToCalculate;
    solveFunc = @(p) (findBandEdge(p, n+1, 'bottom')/pi)^2 - (findBandEdge(p, n, 'top')/pi)^2;
    bandGap{n} = arrayfun(solveFunc, pArray);
end

%plot egVsP
figure()
loglog(pArray, bandGap{1})
csvwrite(strcat('data\egVsP_N-', num2str(1), '.csv'), transpose([pArray; bandGap{1}]));
hold all;
for n = 2:gapsToCalculate;
    plot(pArray, bandGap{n});
    csvwrite(strcat('data\egVsP_N-', num2str(n), '.csv'), transpose([pArray; bandGap{n}]));
end
hold off;
set(gca, 'YLim', [3e-2, 30]);
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
set(gca, 'XTickLabel',num2str(get(gca,'XTick')'));
xlabel('Coupling Strength (P)')
ylabel('Band Gap (Eg)')

%calculate egVsN
figure()
pArray = logspace(log10(.1), log10(1000), 10);
bandGap = cell(1,length(pArray));
nArray = 1:20;

i = 1;
for p = pArray
    solveFunc = @(n) (findBandEdge(p, n+1, 'bottom')/pi)^2 - (findBandEdge(p, n, 'top')/pi)^2;
    bandGap{i} = arrayfun(solveFunc, nArray);
    i = i + 1;
end

%plot egVsN
semilogy(nArray, bandGap{1})
csvwrite(strcat('data\egVsN_P-', num2str(pArray(1)), '.csv'), transpose([nArray; bandGap{1}]));
hold all;
for i = 2:length(pArray)
    plot(nArray, bandGap{i})
    csvwrite(strcat('data\egVsN_P-', num2str(pArray(i)), '.csv'), transpose([nArray; bandGap{i}]));
end
hold off;
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
xlabel('Band Gap Number (N)')
ylabel('Bang Gap (Eg)')
