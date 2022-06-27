function [g] = gvector_multiplicative(f,n,p,iprint)
%
% Construct g vetor for multiplicative Schwarz
%

g= zeros(n*p,1);
for i=1:p
    g((i-1)*n+1:i*n,1)=f(i,1:n);
end

if iprint >= 4
    fprintf('gvector_multiplicative \n')
    disp(g')
end

end

