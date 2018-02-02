function I = lineint1(f,x,y,z,t,a,b)
if nargin == 5
    a = 0;
    b = 2*pi;
end
I = int(f*sqrt(diff(x,t)^2+diff(y,t)^2+diff(z,t)^2),t,a,b);
end