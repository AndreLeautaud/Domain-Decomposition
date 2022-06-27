function [wstore] = STiteration(S,T,g,n,p,K,iprint)
%
% Perform multiplicative additive Schwarz iteration using S and T matrices
% Store solutions from K iterations in a one-dimensional vector
%

wstore= zeros(n*p*K,1);

w= zeros(n*p,1);
w= S\g;
wstore(1:n*p,1)= w;

if iprint >= 4
    fprintf('STiteration: w at iteration 1 \n')
    disp(w')
end

for k=2:K
    w= S\(g-T*w);   
    wstore((k-1)*n*p+1:k*n*p,1)= w(1:n*p,1);
    
    if iprint >= 4
        fprintf(['STiteration: w at iteration ', num2str(k), '\n'])
        disp(w')
    end
    
end


end

