format long
%
% x^2+y^2 integrated from -1 to 1 in x and -1 to 1 in y = 8/3
%
[bx,by,w]=grule2d(2,2);
vol1=gquad2d('gxy',-1,1,-1,1,bx,by,w)
% or
vol1a=quad2dg('gxy',-1,1,-1,1)
% or
vol2=gquad2d('gxy',-1,1,-1,1,2,2)
% or
nvol1= gquadnd('hx',[-1;-1],[1;1],[2;2])
% or
nvol1a=quadndg('hx',[-1;-1],[1;1])
correct_ans=8/3
%
% x^2+y^2 integrated from 0 to 2 in x and 0 to 2 in y = 32/3
%
vol3=gquad2d('gxy',0,2,0,2,bx,by,w)
% or
vol3a=quad2dg('gxy',0,2,0,2)
% or
vol4=gquad2d('gxy',0,2,0,2,2,2)
% or
nvol2 = gquadnd('hx',[0;0],[2;2],[2;2])
% or
nvol2a = quadndg('hx',[0;0],[2;2])
correct_ans=32/3
%
% x^2+y^2 integrated from 0 to 3 in x and 0 to 3 in y = 54
%
vol5=gquad2d('gxy',0,3,0,3,bx,by,w)
% or
vol6=gquad2d('gxy',0,3,0,3,2,2)
% or
% nvol3 = gquadnd('hx',[0;0],[3;3],[2;2])
correct_ans=54
%
% x^2+y^2 integrated from 0 to 3 in x and 0 to 3 in y = 54
% with the general area of intergration (functional limits in x)
%
[bx2,wx,by2,wy]=grule2dgen(2,2);
vol7=gquad2dgen('gxy','gliml','glimh',0,3,bx2,wx,by2,wy)
% or
vol8=gquad2dgen('gxy','gliml','glimh',0,3,2,2)
% or
vol8a=quad2dggen('gxy','gliml','glimh',0,3)
correct_ans=54
%
% x^2+y^2 integrated from 0 to y in x and 0 to 2 in y = 16/3
%
vol9=gquad2dgen('gxy','gliml','glimh2',0,2,bx2,wx,by2,wy)
% or
vol10=gquad2dgen('gxy','gliml','glimh2',0,2,2,2)
correct_ans=16/3
%
% 1 integrated from -sqrt(4-y^2) to sqrt(4-y^2) in x 
% and -2 to 2 in y = 4*pi -- area of circle with radius 2 or (pi r^2)
%
vol11=gquad2dgen('gxy1','lcrcl','lcrcu',-2,2,bx2,wx,by2,wy)
% or
vol12=gquad2dgen('gxy1','lcrcl','lcrcu',-2,2,2,2)
correct_ans=4*pi
%         ---  same problem better quadratue (more points)
% 1 integrated from -sqrt(4-y^2) to sqrt(4-y^2) in x 
% and -2 to 2 in y = 4*pi -- area of circle with radius 2 or (pi r^2)
%
[bx3,wx3,by3,wy3]=grule2dgen(5,5);
vol13=gquad2dgen('gxy1','lcrcl','lcrcu',-2,2,bx2,wx,by2,wy)
% or
vol14=gquad2dgen('gxy1','lcrcl','lcrcu',-2,2,5,5)
correct_ans=4*pi
%
% sqrt(x^2+y^2) integrated from -sqrt(4-y^2) to sqrt(4-y^2) in x 
% and -2 to 2 in y = 16*pi/3
%
% Need higher order quadrature
[bx3,wx3,by3,wy3]=grule2dgen(10,10);
vol15=gquad2dgen('gxy2','lcrcl','lcrcu',-2,2,bx3,wx3,by3,wy3)
% or
vol16=gquad2dgen('gxy2','lcrcl','lcrcu',-2,2,10,10)
correct_ans=16*pi/3
%
% 1/sqrt(1-x^2) integrated from -1 to 1 in x  = pi
%
% Use Gauss-Chebyshev quadrature
[bpc,wfc]=crule(2);
area1=gquad('gxy1',-1,1,1,bpc,wfc)
%or
area1a=quadc('gxy1',-1,1)
correct_ans=pi
%
% x^2/sqrt(1-x^2) integrated from -1 to 1 in x  = pi/2
%
% Use Gauss-Chebyshev quadrature
area2=gquad('xsquar',-1,1,1,bpc,wfc)
area2a=quadc('xsquar',-1,1)
correct_ans=pi/2
