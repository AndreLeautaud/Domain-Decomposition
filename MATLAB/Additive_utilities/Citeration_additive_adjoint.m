function [phiglobal_store]= Citeration_additive_adjoint(C,psi,alpha,n,p,K,iprint)
%
% Perform additive Schwarz iteration
% Compute contribution from each subdomain independently
% Introduce random error in each subdomain computation
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

CC= zeros(n,n);
phi= zeros(n,1);

phiglobal= zeros(n,1);
phiglobal_store= zeros(K*n,1);

phiglobal(1:n,1)= psi;
phiglobal_store((K-1)*n+1:K*n,1)= phiglobal(1:n,1);

for k=K-1:-1:1
  
    for i=p:-1:1
        % Compute the contributions from each subdomain (independently)
        CC(1:n,1:n)= C(i,1:n,1:n);
        phi(1:n,i)= CC' * phiglobal(1:n);      
         
        if iprint >= 4
            fprintf('Citeration_additive_adjoint: k= %i3, i= %3i \n', k, i)
            tmp(1:n,1)= phi(1:n,i);
            tmp'
        end
    end
    
    % Perform update
    sum= zeros(n,1);
    for i=1:p
        sum= sum + phi(1:n,i);
    end
    phiglobal(1:n,1)= phiglobal(1:n,1) - alpha*sum;
    phiglobal_store((k-1)*n+1:k*n,1)= phiglobal(1:n,1);
  
end

end
