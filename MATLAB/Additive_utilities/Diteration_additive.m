function [wstore] = Diteration_additive(D,g,n,p,K,iprint)
%
% Perform overlapping additive Schwarz iteration
% Multiply by (single) iteration matrix DD
% Store solutions from K iterations in a one-dimensional vector
%

wstore= zeros(n*K,1);
w= zeros(n,1);
% w= randn(n,1);

% Perform K iterations
for k=1:K   
    w= D*w+g;
    wstore((k-1)*n+1:k*n,1)= w(1:n,1);
    if iprint >= 4
        fprintf(['Diteration_additive: w at iteration ',num2str(k),'\n'])
        disp(w')
    end    
end

fprintf('Diteration_additive: Asymptotic solution (asol)= inv(eye(n)-D)*g \n')
fprintf('Diteration_additive: max(eig(D))= %13.6e \n', max(eig(D)))
asol= inv(eye(n)-D)*g;
fprintf('Diteration_additive: norm(w-asol)= %13.6e \n', norm(w-asol))

end
