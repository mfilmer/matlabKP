
%calculate egVsP
gapsToCalculate = 10;
bandGap = cell(1,gapsToCalculate);
pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up

for i = 1:gapsToCalculate;
    solveFunc = @(p) findBandEdge(p, i+1, 'bottom') - findBandEdge(p, i, 'top');
    bandGap{i} = arrayfun(solveFunc, pArray);
end

%plot egVsP
figure()
loglog(pArray, bandGap{1})
hold on;
for i = 2:gapsToCalculate;
    plot(pArray, bandGap{i});
end
hold off;
set(gca, 'YLim', [4e-2, 4]);
set(gca, 'YTickLabel',num2str(get(gca,'YTick')'));
set(gca, 'XTickLabel',num2str(get(gca,'XTick')'));
xlabel('P')
ylabel('Eg')

%calculate egVsN
figure()
pArray = logspace(log10(.1), log10(1000), 10);
bandGap = cell(1,length(pArray));
nArray = 1:20;

i = 1;
for p = pArray
    solveFunc = @(n) findBandEdge(p, n+1, 'bottom') - findBandEdge(p, n, 'top');
    bandGap{i} = arrayfun(solveFunc, nArray);
    i = i + 1;
end

%plot egVsN
semilogx(nArray, bandGap{1})
hold on;
for i = 2:length(pArray)
    plot(nArray, bandGap{i})
end
hold off;

