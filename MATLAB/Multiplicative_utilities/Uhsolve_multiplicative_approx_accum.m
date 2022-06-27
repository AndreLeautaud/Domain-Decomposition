function [zexact,zapprox,resid] = Uhsolve_multiplicative_approx_accum(U,D,h,n,p,K,mpert,wpert,iprint)
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

cumzpert= zeros(n*p*K,1);
for i=1:K

    % Accumulate errors in each of the p subdomain solves
    for j=1:p
        j1= (i-1)*n*p + (j-1)*n + 1;
        j2= (i-1)*n*p + j*n;

        % Accumulate errors from previous iterations
        if j1==1
            cumzpert(j1:j2)= zpert(j1:j2);
        else
            DD(1:n,1:n)= D(j,1:n,1:n);
            cumzpert(j1:j2)= DD*cumzpert(j1-n:j2-n) + zpert(j1:j2);
        end

    end
    zapprox= zexact + cumzpert;
    resid= h - U*zapprox;


end

