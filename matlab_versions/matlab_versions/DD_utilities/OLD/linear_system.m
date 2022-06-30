function [M,y,xstore] = Linear_system(n)
%
% Create and solve linear system (multiplicative Schwarz)
%

rng('default')
rng(1)
M=eye(n,n)+0.25 *randn(n,n);
y=randn(n,1);
x=M\y;
xstore=x;


end

