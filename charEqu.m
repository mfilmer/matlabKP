function equ = charEqu(p, offset)
%CHAREQU create a KP model characteristic equation with provided p
equ = @(x) p * sin(x) / x + cos(x) + offset;
end