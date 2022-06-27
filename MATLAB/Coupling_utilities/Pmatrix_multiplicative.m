function P = Pmatrix_multiplicative(n,p,K,nb,ne)
%
%  ***   P = Pmatrix_multiplicative(n,p,K,nb,ne)   ***
%
% Construct the projection matrices for multiplicative Schwarz
%

P= zeros(n,n*p*K);
q= zeros(n,n);

ii= n*p*(K-1);
i1= ii + n*(p-1) + 1;
i2= ii + n*p;

j1= nb(p);
j2= ne(p);

for i=j1:j2
    q(i,i)= 1;
end
P(1:n,i1:i2)= q;

for ip=p-1:-1:1
    
    q= zeros(n,n);
    i1= ii + n*(ip-1) + 1;
    i2= ii + n*ip;
    
    j1= nb(ip);
    j2= nb(ip+1) - 1;
    
    for i=j1:j2
        q(i,i)= 1;
    end
    
    P(1:n,i1:i2)= q;
    
end

% fprintf('Pmatrix_multiplication \n')
% P*P'

end

