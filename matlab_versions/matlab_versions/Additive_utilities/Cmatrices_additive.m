function [C] = Cmatrices_additive(M,B,n,p,iprint)
%
% Construct C matrices for additive Schwarz
% C= 3D matrix containing 2D "C_i" matrices restricted to each of the i=1,...,p subdomains
%

C= zeros(p,n,n);
CC= zeros(n,n);
BB= zeros(n,n);
for i=1:p
    BB(1:n,1:n)= B(i,1:n,1:n);
    CC(1:n,1:n)= BB(1:n,1:n)*M(1:n,1:n);
    C(i,1:n,1:n)= CC(1:n,1:n);
end

if iprint >= 4
    fprintf('Cmatrices_additive: C matrices \n')
    for i=1:p
        tmp= zeros(n,n);
        fprintf('Subdomain %3i \n',i)
        tmp(1:n,1:n)= C(i,1:n,1:n);
        disp(tmp(1:n,1:n))
    end
end

end
