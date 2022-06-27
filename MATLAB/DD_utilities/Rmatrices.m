function [R] = Rmatrices(n,p,nn,index,iprint)
%
% Construct R matrix  
% R= 3D matrix containing 2D restriction "R_i" matrices for each of the i=1,...,p subdomains
%

nnmax= max(nn);
R= zeros(p,nnmax,n);

% Restriction matrics have size nn(i) x n, i=1..p
for i=1:p
    RR= zeros(nnmax,n);
    for j=1:nn(i)
        RR(j,index(i,j))= 1;
        R(i,1:nnmax,1:n)= RR(1:nnmax,1:n);
    end
end

if iprint >= 4
    for i=1:p
        tmp=zeros(nnmax,n);
        fprintf('Rmatrices: subdomain %3i \n',i)
        tmp(1:nn(i),1:n)= R(i,1:nn(i),1:n);
        disp(tmp(1:nn(i),1:n))
    end
end

end
