function [B] = Bmatrices(A,R,n,p,nn,iprint)
%
% Construct B matrices for multiplicative Schwarz
%

nnmax=max(nn);
B=zeros(p,n,n);
RR=zeros(nnmax,n);
AA=zeros(nnmax,nnmax);

for i=1:p
    RR(1:nn(i),1:n) = R(i,1:nn(i),1:n);
    AA(1:nn(i),1:nn(i)) = A(i,1:nn(i),1:nn(i));
    B(i,1:n,1:n) = RR(1:nn(i),1:n)' * inv(AA(1:nn(i),1:nn(i))) * RR(1:nn(i),1:n);
end

if iprint >= 4
    fprintf('Print B matrices \n')
    tmp=zeros(n,n);
    for i=1:p
        fprintf('i=%2i \n',i)
        tmp(1:n,1:n)=B(i,1:n,1:n);
        tmp(1:n,1:n)
    end
end

end

