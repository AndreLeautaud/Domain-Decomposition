function [vglobal_store,vaglobal_store,rglobal_store]= Citeration_additive_approx(C,f,alpha,n,p,K,mpert,wpert,iprint)
%
% Perform additive Schwarz iteration
% Compute contributions from each subdomain independently
% Introduce random error in each subdomain computation
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

CC= zeros(n,n);
ff= zeros(n,1);

% v, va and r contain the subdomain contributions
v= zeros(n,p);
va= zeros(n,p);
r= zeros(n,p);

% vglobal, vaglobal and rglobal contain the global values
vglobal= zeros(n,1);
vaglobal= zeros(n,1);
rglobal= zeros(n,1);

vglobal_store= zeros(n*K,1);
vaglobal_store= zeros(n*(K+1),1);
rglobal_store= zeros(n*K,1);

for i=1:K
    if iprint >= 4
        fprintf('\nCiteration_additive_approx: Outer iteration %3i \n', i)
    end
    
    for j=1:p
        % Compute the contributions from each subdomain
        CC(1:n,1:n)= C(j,1:n,1:n);
        ff(1:n,1)= f(j,1:n);
        v(1:n,j)= ff-CC*vglobal(1:n,1);
        j1= (i-1)*n*p + (j-1)*n + 1;
        j2= (i-1)*n*p + j*n;
        va(1:n,j)= ff-CC*vaglobal(1:n,1) + mpert*wpert(j1:j2,1);
    end
    
    % Perform update of global solution
    for j=1:p
        vglobal(1:n,1)= vglobal(1:n,1) + alpha*v(1:n,j);
        vaglobal(1:n,1)= vaglobal(1:n,1) + alpha*va(1:n,j);
    end
    vglobal_store((i-1)*n+1:i*n,1)= vglobal(1:n,1);
    vaglobal_store(i*n+1:(i+1)*n,1)= vaglobal(1:n,1);
      
    diff= vglobal-vaglobal;
    if iprint >= 4
        fprintf('Citeration_additive_approx: Difference = %10.4e \n', norm(diff))
    end
    
    D= Dmatrix_additive(C,alpha,n,p,iprint);
    g= gvector_additive(f,alpha,n,p,iprint);
    rglobal= (g + D*vaglobal_store((i-1)*n+1:i*n,1)) - vaglobal(1:n,1);
    rglobal_store((i-1)*n+1:i*n,1)= rglobal(1:n,1);  

end

end
