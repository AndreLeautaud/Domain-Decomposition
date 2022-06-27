function [g] = gvector_additive(f,alpha,n,p,iprint)
%
% Construct g vector for additive Schwarz
%

g= zeros(n,1);
for i=1:p
    ff(1:n,1)= f(i,1:n);
    g(1:n,1)= g(1:n,1) + ff(1:n,1);
end
g(1:n,1)= alpha*g(1:n,1);

if iprint >= 4
    fprintf('gvector_additive: g \n')
    disp(g')
end

end
