function int = quad2dg(fun,xlow,xhigh,ylow,yhigh,tol)
%usage:  int = quad2dg('Fun',xlow,xhigh,ylow,yhigh)
%or
%        int = quad2dg('Fun',xlow,xhigh,ylow,yhigh,tol)
%
%This function is similar to QUAD or QUAD8 for 2-dimensional integration,
%but it uses a Gaussian quadrature integration scheme.  
% 	int     -- value of the integral
%       Fun     -- Fun(x,y) (function to be integrated)
%       xlow    -- lower x limit of integration
%       xhigh   -- upper x limit of integration
%       ylow    -- lower y limit of integration
%       yhigh   -- upper y limit of integration
%       tol     -- tolerance parameter (optional)
%Note that if there are discontinuities the region of integration 
%should be broken up into separate pieces.  And if there are singularities,
%a more appropriate integration quadrature should be used 
%(such as the Gauss-Chebyshev for a specific type of singularity).

%This routine could be optimized.

if exist('tol')~=1,
  tol=1e-3;
elseif tol==[],
  tol=1e-3;
end

n=length(xlow);
nquad=2*ones(n,1);
[bpx,bpy,wfxy] = grule2d(2,2);
int_old=gquad2d(fun,xlow,xhigh,ylow,yhigh,bpx,bpy,wfxy);

converge='n';
for i=1:7,
  [bpx,bpy,wfxy] = grule2d(2^(i+1),2^(i+1));
  int=gquad2d(fun,xlow,xhigh,ylow,yhigh,bpx,bpy,wfxy);

  if abs(int_old-int) < abs(tol*int),
    converge='y';
    break;
  end
  int_old=int;
end

if converge=='n',
  disp('Integral did not converge--singularity likely')
end

