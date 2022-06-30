function [h] = hvector_additive(g,n,K,iprint)
%
% Construct h vector for additive Schwarz
%

h= zeros(K*n,1);
for i=1:K
    h((i-1)*n+1:i*n,1)= g(1:n,1);
end

if iprint >= 4
    fprintf('hvector_additive: h \n')
    disp(h')
end

end
