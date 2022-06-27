function [vstore] = Citeration_additive(C,f,alpha,n,p,K,iprint)
%
%  ***   [vstore] = Citeration_additive(C,f,alpha,n,p,K,iprint)   ***
%
% Perform the basic additive Schwarz iteration
% Compute contribution from each subdomain independently
% Store solutions from K iterations in a one-dimensional vector
%

vstore= zeros(n*K,1);
v= zeros(n,1);

for k=1:K
    dv= zeros(n,p);

    % Calculate and store subdomain contributions (independently)
    for i=1:p
        CC(1:n,1:n)= C(i,1:n,1:n);
        ff(1:n,1)= f(i,1:n);
        dv(1:n,i)= ff-CC*v(1:n,1);
        if iprint >= 6
            fprintf(['Citeration_additive: dv on subdomain ', num2str(i), 'at iteration ', num2str(k),'\n'])
            disp(dv')
        end
    end
    
    % Perform update by summing weighted subdomain contributions
    for i=1:p
        v(1:n,1)= v(1:n,1) + alpha*dv(1:n,i);
    end
    if iprint >= 6
        fprintf(['Citeration_additive: v at iteration ', num2str(k), '\n'])
        disp(v')
    end    
    
    % Store iterates in a 1D vector
    vstore((k-1)*n+1:k*n,1)= v(1:n,1);

end

end
