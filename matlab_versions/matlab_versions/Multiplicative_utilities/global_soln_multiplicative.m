function [vglobal]= global_soln_multiplicative(vstore,n,p,K,nb,ne)
%
% Construct the global solution from the subdomain solutions
%

vglobal= zeros(n,1);
ii= n*p*(K-1);

i1= ii + n*(p-1) + nb(p);
i2= ii + n*(p-1) + ne(p);

j1= nb(p);
j2= ne(p);

vglobal(j1:j2)= vstore(i1:i2);

for ip=p-1:-1:1
    i1= ii + n*(ip-1) + nb(ip);
    i2= ii + n*(ip-1) + nb(ip+1) - 1;
    
    j1= nb(ip);
    j2= nb(ip+1) - 1;
    vglobal(j1:j2)= vstore(i1:i2);
end

% % Perform the same operation by constructing a projection matrix P
% P= Pmatrix_multiplicative(n,p,K,nb,ne);
% vv= P*vstore;
% fprintf('norm(vglobal-vv)= %13.6e \n',norm(vglobal-vv))


end

