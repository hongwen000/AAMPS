function myezplot3(f)
[x,y]=meshgrid(-10:.2:10,-10:.2:10);
z = feval(f, x, y);
surf(x,y,z);