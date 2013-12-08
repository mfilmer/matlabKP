function equ = charEqu(p)
%CHAREQU create a KP model characteristic equation with provided p
equ = @(x) p * sin(x) / x + cos(x);
end