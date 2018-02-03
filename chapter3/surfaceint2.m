function I = surfaceint2(P,Q,R,x,y,z,u,ua,ub,v,va,vb)
xu = diff(x,u);
yu = diff(y,u);
zu = diff(z,u);
xv = diff(x,v);
yv = diff(y,v);
zv = diff(z,v);
A = yu*zv - zu*yv;
B = zu*xv - xu*zv;
C = xu*yv - yu*xv;
f = A*P + B*Q + C*R;
I = int(int(f,u,ua,ub),v,va,vb);
end