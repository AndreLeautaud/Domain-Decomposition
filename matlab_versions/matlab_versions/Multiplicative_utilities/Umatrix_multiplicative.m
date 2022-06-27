function [U] = Umatrix_multiplicative(S,T,n,p,K,iprint)
%
% Construct U matrix for mutliplicative Schwarz
%

U=zeros(K*n*p,K*n*p);
for i=1:K
    U((i-1)*n*p+1:i*n*p, (i-1)*n*p+1:i*n*p) = S(1:n*p,1:n*p);
end
for i=1:K-1
    U(i*n*p+1:(i+1)*n*p, (i-1)*n*p+1:i*n*p) = T(1:n*p,1:n*p);
end

if iprint >= 6
    fprintf('Umatrix_multiplicative: U matrix \n')
    U
end

end

