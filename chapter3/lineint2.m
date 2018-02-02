function I = lineint2(P,Q,R,x,y,z,t,a,b)
if nargin == 7
    a = 0;
    b = 2*pi;
end
F  = [P;Q;R];
ds = [diff(x,t);diff(y,t);diff(z,t)];
I  = int(dot(F,ds),a,b);
end