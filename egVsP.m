m_0 = 9.10938;          % [kg] mass of electron
hbar = 1.054572e-34;    % [Js] reduced Planck constant
q = 1.602177e-19;       % [C] elementary charge

pArray = logspace(log10(0.1), log10(1000), 100);
arrayLen = length(pArray);  %yeah, I know it is hardcoded one line up
equArray = cell(1,arrayLen);
for i = 1:arrayLen
    equArray{i} = charEqu(pArray(i));
end
solveFunc = makeSolveFunc(1.1*pi, 2*pi);
alphaAArray = arrayfun(solveFunc, equArray);

