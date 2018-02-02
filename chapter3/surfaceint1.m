function I = surfaceint1(varargin)
%Cartesian equation:    f,S,x,xx,xy,y,yx,yy
%Parametric equation:   f,x,y,z,u,ua,ub,v,va,vb
    if nargin == 8
        f = varargin{1};
        S = varargin{2};
        x = varargin{3};
        xx = varargin{4};
        xy = varargin{5};
        y = varargin{6};
        yx = varargin{7};
        yy = varargin{8};
        dS = sqrt(1 + diff(S,x)^2 + diff(S,y)^2);
        I = int(int(f*dS,x,xx,xy),yx,yy);
    elseif nargin == 10
        f = varargin{1};
        x = varargin{2};
        y = varargin{3};
        z = varargin{4};
        u = varargin{5};
        ua = varargin{6};
        ub = varargin{7};
        v = varargin{8};
        va = varargin{9};
        vb = varargin{10};
        xu = diff(x,u);
        yu = diff(y,u);
        zu = diff(z,u);
        xv = diff(x,v);
        yv = diff(y,v);
        zv = diff(z,v);
        E = xu^2 + yu^2 + zu^2;
        F = xu*xv + yu*yv + zu*zv;
        G = xv^2 + yv^2 + zv^2;
        dt = sqrt(E*G - F^2);
        I = int(int(f*dt,u,ua,ub),v,va,vb);
    else
        error("Wrong number of argument")
    end
end