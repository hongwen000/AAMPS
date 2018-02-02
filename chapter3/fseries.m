function [A,B,F] = fseries(f,x,p,a,b)
    %-----------------
    %deal with interval length
    if nargin == 3
        a = -pi;
        b = pi;
    end
    L = (b - a)/ 2;
    if a + b ~= 0
        f = subs(f, x, x + L + a);    %Variable replacement, x-hat = x - L - a
    end
    %-----------------
    %calculate fourier coefficient
    A = zeros(p + 1,1);
    B = zeros(p,1);
    A(1,1) = int(f,x,-L,L)/L;         %A0
    F = A(1,1)/2;                     %F = A0/2
    for n=1:p
        An = int(f*cos(n*pi*x/L),x,-L,L)/L;
        Bn = int(f*sin(n*pi*x/L),x,-L,L)/L;
        A(n + 1,1) = An;              %A1...An
        B(n,1) = Bn;                  %B1...Bn
        F  = F + An*cos(n*pi*x/L)+Bn*sin(n*pi*x/L);
    end
    %-----------------
    %(-L,L)->(a,b)
    if a + b ~= 0
        F = subs(F, x, x - L -a);
    end
end
    
