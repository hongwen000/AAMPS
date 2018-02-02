function I = surfaceint2(P,Q,R,x,y,z,u,ua,ub,v,va,vb)
xu = diff(x,u);
yu = diff(y,u);
zu = diff(z,u);
xv = diff(x,v);
x