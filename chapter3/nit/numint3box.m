function out=numint3box(varargin)
%NUMINT3BOX Numerically evaluate triple integral over a box, using the
%   "Numerical Integration Toolbox". 
%   NUMINT3BOX is basically a "wrapper" for GQUADND, to
%   get around the fact that the latter requires inline vectorized input.  The
%   INNER integral should be written first.
%   Example:
%       syms x y z
%       numint3box(x*y*z,x,0,1,y,0,1,z,0,1) integrates
%       the function x*y*z over the box 0<x<1, 0<y<1, 0<z<1.
%       The exact value is of course 1/8.
%   See also NUMINT2.
%   The optional final parameter gives the number of subdivisions to use in each direction.
%   Increasing this improves the accuracy but slows down the execution.  The default is 8.
if nargin<10, error('not enough input arguments -- need at least integrand, variables with their limits'); end
if nargin>11, error('too many input arguments'); end
steps=8; %This is the default.
if nargin==11, steps=varargin{11}; end
integrand=varargin{1};
var1=varargin{2};
var2=varargin{5};
var3=varargin{8};
lim1=[varargin{3},varargin{6},varargin{9}];
lim2=[varargin{4},varargin{7},varargin{10}];
%  The VECTOR variable will be xXX=[var1,var2,var3]
integrandstr=strrep(strrep(strrep(vectorize(integrand),char(var1),'xXX(1)'), ...
   char(var2),'xXX(2)'),char(var3),'xXX(3)');
integrand1=inline([integrandstr,'+eps*ones(size(xXX))'],'xXX');
out1=gquadnd(integrand1,lim1,lim2,steps*ones(3));
out=out1(1);
