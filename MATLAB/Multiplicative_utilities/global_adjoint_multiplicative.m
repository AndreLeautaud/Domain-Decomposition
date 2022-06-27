function phiglobal= global_soln_multiplicative(xi,n,p,K,nb,ne)
%
% Construct the global adjoint from the subdomain solutions
%

phiglobal= zeros(n,1);

i1= nb(1);
i2= ne(1);

j1= nb(1);
j2= ne(1);

phiglobal(j1:j2)= xi(i1:i2);

for ip=2:p
    i1= ne(ip-1)+1;
    i2= ne(ip);
    
    j1= ne(ip-1)+1;
    j2= ne(ip);
    phiglobal(j1:j2)= xi(i1:i2);    
end

end

