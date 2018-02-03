function out=newnumint2(varargin)
%NEWNUMINT2 Numerically evaluate double integral, using the
%   "Numerical Integration Toolbox". 
%   NEWNUMINT2 is basically a "wrapper" for GQUAD2DGEN, to
%   get around the fact that the latter requires inline vectorized input.  The
%   INNER integral should be written first.
%   Example:
%       syms x y
%       newnumint2(x,y,0,x,x,1,2) integrates
%       the function x over the trapezoid 1<x<2, 0<y<x,
%       and gives the numerical output 2.3333.
%   See also SYMINT2.
%   The optional final parameter gives the number of subdivisions to use in each direction.
%   Increasing this improves the accuracy but slows down the execution.  The default is 20.
if nargin<7, error('not enough input arguments -- need at least integrand,var1,varlim1,varlim2,var2,lim1,lim2'); end
if nargin>8, error('too many input arguments'); end
steps=20; %This is the default.
if nargin==8, steps=varargin{8}; end
integrand=varargin{1};
var1=varargin{2};
varlim1=varargin{3};
varlim2=varargin{4};
var2=varargin{5};
lim1=double(varargin{6});
lim2=double(varargin{7});
integrand1=inline([char(vectorize(integrand)),'+eps*ones(size(',char(var1),'))'],char(var1),char(var2));
limlow=inline([char(vectorize(varlim1-var2+var2)),'+eps*ones(size(',char(var2),'))'],char(var2));
limhi =inline([char(vectorize(varlim2-var2+var2)),'+eps*ones(size(',char(var2),'))'],char(var2));
out=gquad2dgen(integrand1,limlow,limhi,lim1,lim2,steps,steps);
