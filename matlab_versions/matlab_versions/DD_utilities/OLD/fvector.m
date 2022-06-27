function [f] = fvector(B,y,n,p,iprint)
%
% Construct f vector for multiplicative Schwarz
%

f=zeros(p,n);
for i=1:p
    BB(1:n,1:n)=B(i,1:n,1:n);
    f(i,1:n) = BB(1:n,1:n)*y(1:n,1);
end

if iprint >= 4
    fprintf('Print f vector \n')
    tmp=zeros(n,1);
    for i=1:p
        fprintf('i=%2i \n',i)
        tmp(1:n,1)=f(i,1:n);
        tmp(1:n,1)
    end
end

end

