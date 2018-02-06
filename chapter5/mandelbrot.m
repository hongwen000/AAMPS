function W=mandelbrot(X,Y,c,a,n_iter)
    C=X+Y*sqrt(-1);
    W=zeros(size(X));
    Z=c;
    for k=1:n_iter
        Z=Z.^2+C;
        i0=find(abs(Z)>a);
        W(i0)=k;
        Z(i0)=NaN;
    end
    W(W==0)=NaN;
end