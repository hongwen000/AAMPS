function [x,y]=frac_tree(x0,y0,v)
    N=length(v);
    x=[x0;zeros(N-1,1)];
    y=[y0;zeros(N-1,1)];
    for ii = 2:N
        vv=v(ii);
        if  vv<0.05 ,y(ii)=0.5*y(ii-1);
            elseif vv<0.45, x(ii)=0.42*(x(ii-1)-y(ii-1));y(ii)=0.2+0.42*(x(ii-1)+y(ii-1));
            elseif vv<0.85, x(ii)=0.42*(x(ii-1)+y(ii-1));y(ii)=0.2-0.42*(x(ii-1)-y(ii-1));
            else, x(ii)=0.1*x(ii-1);y(ii)=0.1*y(ii-1)+0.2;
        end
    end
end