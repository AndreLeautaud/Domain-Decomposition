function [S] = Smatrix_multiplicative(D,n,p,iprint)
%
% Construct S matrix for multiplicative Schwarz
%

S=zeros(n*p,n*p);
for i=1:p
    S((i-1)*n+1:i*n, (i-1)*n+1:i*n) = eye(n,n);
end
for i=2:p
    DD(1:n,1:n)=D(i,1:n,1:n);
    S((i-1)*n+1:i*n, (i-2)*n+1:(i-1)*n) = -DD(1:n,1:n);
end

if iprint >= 4
    fprintf('Smatrix_multiplicative \n')
    disp(S)
end

end

