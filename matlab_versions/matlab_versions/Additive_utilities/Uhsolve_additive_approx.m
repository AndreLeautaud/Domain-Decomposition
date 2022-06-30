function [zexact,zapprox,zresid] = Uhsolve_additive_approx(U,h,n,p,K,alpha,mpert,wpert,iprint)
%
% Perform additive Schwarz iterations
% K iterations performed by single matrix solve
% Introduce random error
% Store solutions from K iterations in a one-dimensional vector
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

zexact= U\h;
zpert= zeros(n*K,1);

% Accumulate errors made in each subdomain solve.
% These sum within each iteration
% These accumulate weighted by D between each iteration 
for i=1:K
    i1= (i-1)*n + 1;
    i2= i*n;

    % Accumulate errors in each of the p subdomain solves
    for j=1:p
        j1= (i-1)*n*p + (j-1)*n + 1;
        j2= (i-1)*n*p + j*n;
        zpert(i1:i2)= zpert(i1:i2) + alpha*mpert*wpert(j1:j2);
    end

end

zapprox= zexact + zpert;
zresid= h - U*zapprox;


end
