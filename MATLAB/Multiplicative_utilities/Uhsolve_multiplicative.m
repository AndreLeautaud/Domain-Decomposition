function [z] = Uhsolve_multiplicative(U,h,n,p,K,iprint)
%
% Perform overlapping multiplicative Schwarz iterations
% K iterations performed by single matrix solve
% Store solutions from K iterations in a one-dimensional vector
%

z=U\h;

if iprint >= 4
    for k=1:K
        fprintf(['z at iteration ',num2str(k),'\n'])
        zz(1:n*p,k)=z((k-1)*n*p+1:k*n*p,1);
        disp(zz(1:n*p,k)')
    end
end


end

