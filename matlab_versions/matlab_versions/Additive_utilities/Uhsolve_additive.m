function [z]= Uhsolve_additive(U,h,n,K,iprint)
%
% Perform additive Schwarz iterations
% K iterations performed by single matrix solve
% Store solutions from K iterations in a one-dimensional vector
%

z= U\h;

if iprint >= 4
    for k=1:K
        fprintf(['Uhsolve_additive: z at iteration ',num2str(k),'\n'])
        zz(1:n,k)= z((k-1)*n+1:k*n,1);
        disp(zz(1:n,k)')
    end
end

end
