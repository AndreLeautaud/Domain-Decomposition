function [R] = Rmatrices(n,p,nn,index,iprint)
%
% Create restriction matrices for multiplicative Schwarz
%

nnmax=max(nn);
R=zeros(p,nnmax,n);

for i=1:p
    for j=1:nn(i)
        R(i,j,index(i,j))=1;
    end
end

if iprint >= 4
    fprintf('Print R matrices \n')
    tmp=zeros(nnmax,n);
    for i=1:p
        fprintf('Subdomain %3i \n',i)
        tmp(1:nn(i),1:n)=R(i,1:nn(i),1:n);
        tmp(1:nn(i),1:n)
    end
end

end

