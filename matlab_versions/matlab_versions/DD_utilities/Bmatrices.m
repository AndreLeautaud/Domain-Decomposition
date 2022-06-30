function [B] = Bmatrices(A,R,n,p,nn,iprint)
%
% Construct B matrix 
% B= 3D matrix containing 2D "B_i" matrices for each of the i=1,...,p subdomains
%

nnmax= max(nn);
B= zeros(p,n,n);
BB= zeros(n,n);
RR= zeros(nnmax,n);
AA= zeros(nnmax,nnmax);

for i=1:p
    RR(1:nn(i),1:n)= R(i,1:nn(i),1:n);
    AA(1:nn(i),1:nn(i))= A(i,1:nn(i),1:nn(i));
    BB(1:n,1:n)= RR(1:nn(i),1:n)' * inv(AA(1:nn(i),1:nn(i))) * RR(1:nn(i),1:n);
    B(i,1:n,1:n)= BB(1:n,1:n);
end

if iprint >= 4
    for i=1:p
        tmp= zeros(n,n);
        fprintf('Bmatrices: subdomain %3i \n',i)
        tmp(1:n,1:n)= B(i,1:n,1:n);
        disp(tmp(1:n,1:n))
    end
end

end
