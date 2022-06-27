function [w_store,wa_store,wr_store]= Diteration_additive_approx(D,g,alpha,n,p,K,mpert,wpert,iprint)
%
% Perform additive Schwarz iteration
% Compute contribution from each subdomain independently
% Introduce random error in each subdomain computation
%
% Store exact solutions from K iterations in a one-dimensional vector
% Store approximate solutions from K iterations in a one-dimensional vector
% Store residuals from K iterations in a one-dimensional vector
%

w= zeros(n,1);
wa= zeros(n,1);
wr= zeros(n,1);

w_store= zeros(n*K,1);
wa_store= zeros(n*(K+1),1);
wr_store= zeros(n*K,1);

vpert= zeros(n*K,1);

for i=1:K
    i1= (i-1)*n + 1;
    i2= i*n;

    % Sum errors over ith "sweep"
    for j=1:p
        j1= (i-1)*n*p + (j-1)*n + 1;
        j2= (i-1)*n*p + j*n;
        vpert(i1:i2)= vpert(i1:i2) + alpha*mpert*wpert(j1:j2);
    end

    w= D*w + g;
    wa= D*wa + g + vpert(i1:i2);
    wr= (g + D*wa_store((i-1)*n+1:i*n,1)) - wa(1:n,1);

    w_store((i-1)*n+1:i*n,1)= w(1:n,1);
    wa_store(i*n+1:(i+1)*n,1)= wa(1:n,1);
    wr_store((i-1)*n+1:i*n,1)= wr(1:n,1);  

end

end
