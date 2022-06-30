function [A] = Amatrices(M,R,n,p,nn,iprint)
%
% Construct A matrix
% A= 3D matrix containing 2D "A_i" matrices restricted to each of the i=1,...,p subdomains
%

nnmax= max(nn);
A= zeros(p,nnmax,nnmax);
AA= zeros(nnmax,nnmax);
RR= zeros(nnmax,n);

for i=1:p
    RR(1:nn(i),1:n)= R(i,1:nn(i),1:n);
    AA(1:nn(i),1:nn(i))= RR(1:nn(i),1:n) * M(1:n,1:n) * RR(1:nn(i),1:n)';
    A(i,1:nn(i),1:nn(i))= AA(1:nn(i),1:nn(i));
end

if iprint >= 4
    fprintf('Print A matrices \n')
    tmp=zeros(nnmax,nnmax);
    for i=1:p
        fprintf('Subdomain %3i \n',i)
        tmp(1:nn(i),1:nn(i))= A(i,1:nn(i),1:nn(i));
        tmp(1:nn(i),1:nn(i))
    end
end

end
