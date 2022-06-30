function [v_store,va_store,r_store] = Diteration_approx(D,f,n,p,K,mpert,wpert,iprint)
%
% Perform multiplicative Schwarz iteration
% Compute contribution from each subdomain independently
% Introduce random error in each subdomain computation
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

veps=1e-02;

DD= zeros(n,n);
ff= zeros(n,1);

v= zeros(n,1);
va= zeros(n,1);
r= zeros(n,1);

% Remember the initial trivial solution
v_store= zeros(n*p*(K+1),1);
va_store= zeros(n*p*(K+1),1);
r_store= zeros(n*p*K,1);

for k=1:K

    for i=1:p

        if iprint >= 4
            fprintf('\nDiteration_approx: k= %3i, i= %3i \n', k,i)
        end

        id1= k*n*p+(i-1)*n+1;
        id2= k*n*p+i*n;

        im1= id1-n;
        im2= id2-n;

        ir1= id1-n*p;
        ir2= id2-n*p;

        % Compute the contributions from each subdomain
        DD(1:n,1:n)= D(i,1:n,1:n);
        ff(1:n,1)= f(i,1:n);

        v(1:n,1)= ff + DD* v(1:n,1);
        v_store(id1:id2,1)= v(1:n,1);

        vpert= mpert*wpert(ir1:ir2);

        va(1:n,1)= ff + DD*va(1:n,1) + vpert;
        va_store(id1:id2,1)= va(1:n,1);

        r= ff + DD*va_store(im1:im2) - va(1:n,1);
        r_store(ir1:ir2,1)= r(1:n,1);

        diff= v-va;
        if iprint >= 4
            fprintf('Diteration_approx: Difference = %10.4e \n', k, norm(diff))
            va_store'
        end

    end
end



end

