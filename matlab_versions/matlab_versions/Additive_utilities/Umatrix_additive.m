function [U] = Umatrix_additive(D,n,K,iprint)
%
% Construct U matrix for additive Schwarz
%

U= eye(K*n,K*n);

for i=1:K-1
    U(i*n+1:(i+1)*n, (i-1)*n+1:i*n)= -D(1:n,1:n);
end

if iprint >= 4
    fprintf('Umatrix_additive: U \n')
    disp(U)
end

end
