function [T] = Tmatrix_multiplicative(D,n,p,iprint)
%
% Construct T matrix for multiplicative Schwarz
%

T= zeros(n*p,n*p);
DD(1:n,1:n)= D(1,1:n,1:n);
T(1:n,(p-1)*n+1:p*n)= -DD;

if iprint >= 4
    fprintf('Tmatrix_multiplicative \n')
    disp(T)
end

end

