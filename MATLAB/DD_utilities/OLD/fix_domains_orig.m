function [nn,index] = fix_domains(n,p,iprint)
%
% Create overlapping subdomains and their index sets
%

nn=zeros(p,1);
nn=[3; 3; 5; 4];

nnmax=max(nn);
index=zeros(p,nnmax);

index(1,1:nn(1))=linspace(1,3,3);
index(2,1:nn(2))=linspace(2,4,3);
index(3,1:nn(3))=linspace(4,8,5);
index(4,1:nn(4))=linspace(7,n,4);

if iprint >= 4
    fprintf('Print index sets \n')
    tmp=zeros(nnmax,nnmax);
    for i=1:p
        fprintf('Subdomain %3i \n',i)
        index(i,1:nn(i))
    end
end

end

