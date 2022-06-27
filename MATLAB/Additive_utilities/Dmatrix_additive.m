function [D] = Dmatrix_additive(C,alpha,n,p,iprint)
%
% Construct D matrix for additive Schwarz
%

D= zeros(n,n);
for i=1:p
    CC(1:n,1:n)= C(i,1:n,1:n);
    D= D+CC;
end
D= eye(n,n)-alpha*D;

if iprint >= 4
    fprintf('Dmatrix_additive: D matrix \n')
    disp(D)
end


end
