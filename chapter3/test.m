
syms t;
x = t;
y = t;
z = 0;
f = x^2 + y^2;
p1 = -lineint1(f,x,y,z,t,1,0)
y = t^2;
p2 = lineint1(f,x,y,z,t,0,1)

y2=x^2; I1=int((x^2+y2^2)*sqrt(1+diff(y2,x)^2),x,0,1)