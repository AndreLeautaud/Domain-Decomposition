function [phi_store]= Diteration_adjoint(D,psi,n,p,K,iprint)
%
% Perform multiplicative Schwarz iteration
% Compute contribution from each subdomain independently
% Introduce random error in each subdomain computation
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

DD= zeros(n,n);
phi= zeros(n,1);
phi_store= zeros(n*p*K,1);

phi(1:n,1)= psi;
phi_store(n*p*(K-1)+n*(p-1)+1:n*p*K,1)= phi(1:n,1);

for k=K:-1:1
     
    for i=p:-1:1
        
        if iprint >= 6
            fprintf('\nDiteration_adjoint: k= %3i, i= %3i \n', k,i)
        end
        
        id1= n*p*(k-1) + (i-1)*n + 1;
        id2= n*p*(k-1) + i*n;
        
        ip1= id1+n;
        ip2= id2+n;
              
        % Compute the contributions from each subdomain
        pindex= i+1;
        if i==p
            pindex= 1;
        end

        DD(1:n,1:n)= D(pindex,1:n,1:n);

         if k==K & i==p
            if iprint >= 2
                fprintf('Diteration_adjoint: special case \n')
            end
         else
            phi(1:n,1)= DD' *phi(1:n,1);      
            phi_store(id1:id2)= phi(1:n,1);
        end       
        
    end
    
end

end
