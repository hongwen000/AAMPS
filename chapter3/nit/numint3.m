function out=numint3(varargin)
%NUMINT3 Numerically evaluate triple integral, using the
%   "Numerical Integration Toolbox". 
%   NUMINT3 is basically a "wrapper" for NUMINT3BOX, to
%   get around the fact that the latter requires constant limits of integration.  
%   The integrals should be written from the inside out.
%   Example:
%       syms x y z
%       numint3(1,z,0,sqrt(1-x^2-y^2),y,0,sqrt(1-x^2),x,0,1) 
%       finds the volume of the portion of the unit ball in the
%       first octant. The exact value is of course pi/6.
%   See also NUMINT2.
%   The optional final parameter gives the number of subdivisions to use in each direction.
%   Increasing this improves the accuracy but slows down the execution.  The default is 8.
if nargin<10, error('not enough input arguments -- need at least integrand, variables with their limits'); end
if nargin>11, error('too many input arguments'); end
steps=8; %This is the default.
if nargin==11, steps=varargin{11}; end
integrand=varargin{1};
var1=varargin{2}; var1low=varargin{3}; var1hi=varargin{4};
var2=varargin{5}; var2low=varargin{6}; var2hi=varargin{7};
var3=varargin{8}; var3low=varargin{9}; var3hi=varargin{10};
%  Now we make the change of variables to convert to integral over a box.
syms uU vV wW;
jac=(var1hi-var1low)*(var2hi-var2low)*(var3hi-var3low);
newintegrand=subs(integrand*jac,var1,var1low+uU*(var1hi-var1low));
newerintegrand=subs(newintegrand,var2,var2low+vV*(var2hi-var2low));
newestintegrand=subs(newerintegrand,var3,var3low+wW*(var3hi-var3low));
out=numint3box(newestintegrand,uU,0,1,vV,0,1,wW,0,1);