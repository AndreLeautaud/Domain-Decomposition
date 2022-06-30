function [nn,nb,ne,index] = fix_domains(n,p,iprint)
%
% Create overlapping subdomains and their index sets
%
% Inputs
% ------
% n= matrix dimension
% p= number of subdomains
% iprint
%
% Variables
% ---------
% nn= 1D matrix containing sizes of subdomains
% nnmax= size of largest subdomain
% index= 2D matrix containing elements of each of the p subdomains
%

nn= zeros(p,1);

% (A)
% nn=[3; 4];

% (B)
nn=[6; 4;  2;  3];
nb=[1; 4;  9; 10];
ne=[6; 7; 10; 12];

nnmax=max(nn);
index=zeros(p,nnmax);

% (A)
% index(1,1:nn(1))=linspace(1,3,3);
% index(2,1:nn(2))=linspace(2,5,4);

% (B)
for i=1:p
    index(i,1:nn(i))=linspace(nb(i),ne(i),nn(i));
end
% index(1,1:nn(1))=linspace(nb(1),ne(1),nn(1));
% index(2,1:nn(2))=linspace(nb(2),ne(2),nn(2));
% index(3,1:nn(3))=linspace(nb(3),ne(3),nn(3));
% index(4,1:nn(4))=linspace(nb(4),ne(4),nn(4));
% index(5,1:nn(5))=linspace(nb(5),ne(5),nn(5));


if iprint >= 6
    fprintf('Print index sets \n')
    for i=1:p
        fprintf('Subdomain %3i \n',i)
        index(i,1:nn(i))
    end
end

end
