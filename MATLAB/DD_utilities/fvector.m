function [f] = fvector(B,y,n,p,iprint)
%
% Construct f matrix
% f= 2D matrix containing 1D "f_i" vectors restricted to each of the i=1,...,p subdomains
%

f= zeros(p,n);
ff= zeros(n,1);
BB= zeros(n,n);

for i=1:p
    BB(1:n,1:n)= B(i,1:n,1:n);
    ff= BB(1:n,1:n)*y(1:n,1);
    f(i,1:n)= ff(1:n);
end

if iprint >= 4
    for i=1:p
        tmp= zeros(n,1);
        fprintf('fvector: subdomain %3i \n',i)
        tmp(1:n,1)= f(i,1:n);
        tmp(1:n,1)
    end
end

end
