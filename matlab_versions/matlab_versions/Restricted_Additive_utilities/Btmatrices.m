function [Bt] = Btmatrices_restricted(A,R,Rt,n,p,nn,iprint)
%
% Construct Bt matrices for restricted additive Schwarz
% Bt= 3D matrix containing 2D "BBt" matrices for each of the p subdomains
%
%

nnmax= max(nn);
Bt= zeros(p,n,n);
RR= zeros(nnmax,n);
RRt= zeros(nnmax,n);
AA= zeros(nnmax,nnmax);

for i=1:p
    RR(1:nn(i),1:n)= R(i,1:nn(i),1:n);
    RRt(1:nn(i),1:n)= Rt(i,1:nn(i),1:1:n);
    AA(1:nn(i),1:nn(i))= A(i,1:nn(i),1:nn(i));
    BBt(1:n,1:n)= RRt(1:nn(i),1:n)' * inv(AA(1:nn(i),1:nn(i))) * RR(1:nn(i),1:n);
    Bt(i,1:n,1:n)= BBt(1:n,1:n);
end

if iprint >= 4
    for i=1:p
        tmp= zeros(n,n);
        fprintf('Btmatrices_restricted: subdomain %3i \n', i)
        tmp(1:n,1:n)= Bt(i,1:n,1:n);
        disp(tmp(1:n,1:n))
    end
end

end

