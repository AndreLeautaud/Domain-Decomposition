function [zexact,zapprox,resid] = Uhsolve_multiplicative_approx(U,h,n,p,K,mpert,wpert,iprint)
%
% Perform multiplicative Schwarz iterations
% K iterations performed by single matrix solve
% Introduce random error
% Store solutions from K iterations in a one-dimensional vector
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

zexact= U\h;

zpert= mpert*wpert;
zapprox= zexact+zpert;

resid= h-U*zapprox;

if iprint >= 4
    for k=1:K
        fprintf(['Uhsolve_multiplicative_approx: z at iteration ',num2str(k),'\n'])
        zz(1:n*p,k)= zexact((k-1)*n*p+1:k*n*p,1);
        disp(zz(1:n*p,k)')
    end
end

end

