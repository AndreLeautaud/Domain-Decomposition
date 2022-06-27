function [vstore] = Diteration_multiplicative(D,f,n,p,K,iprint)
%
% Perform multiplicative Schwarz iteration
% Store solutions from K iterations in a one-dimensional vector
%

vstore= zeros(n*p*K,1);
v= zeros(n,1);
for k=1:K
    for i=1:p
        DD(1:n,1:n)= D(i,1:n,1:n);
        ff(1:n,1)= f(i,1:n);
        v= DD*v+ff;
        vstore((k-1)*n*p+(i-1)*n+1:(k-1)*n*p+(i*n),1)= v(1:n,1);
        if iprint >= 6
            fprintf(['Diteration_multiplicative: v at iteration ', num2str(k), ' on subdomain ', num2str(i),'\n'])
            disp(v')
        end
    end    
end

end

