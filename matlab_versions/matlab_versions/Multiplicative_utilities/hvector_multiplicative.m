function [h] = hvector_multiplicative(g,n,p,K,iprint)
%
% Construct h vector for multiplicative Schwarz
%

h=zeros(K*n*p,1);
for i=1:K
    h((i-1)*n*p+1:i*n*p,1)=g(1:n*p,1);
end

if iprint >= 8
    fprintf('hvector_multiplicative: h vector \n')
    disp(h')
end

end

