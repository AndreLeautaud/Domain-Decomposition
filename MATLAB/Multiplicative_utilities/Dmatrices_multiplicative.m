function [D] = Dmatrices_multiplicative(C,n,p,iprint)
%
% Construct D matrix for multiplicative Schwarz
%

D= zeros(p,n,n);
for i=1:p
   CC(1:n,1:n)= C(i,1:n,1:n);
   DD(1:n,1:n)= eye(n,n)-CC;
   D(i,1:n,1:n)= DD(1:n,1:n); 
end
if iprint >= 6
    fprintf('Dmatrices_multiplicative \n')
    disp(D)
end


end
