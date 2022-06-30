function [n,p,K, alpha,nn,nb,ne,index, nnt,nbt,net,indext,  M,y,xstore, mpert,wpert] ...
         = linear_system(sread,swrite,input_file,output_file)
%
% function [n,p,K, alpha,nn,nb,ne,index, nnt,nbt,net,indext,  A,f,ustore, mpert,wpert] ...
%         = linear_system(sread,swrite,file1,file2,file3,file4)
% 
% Create and solve linear system and establish solution strategy
%
% n= size of linear system
% p= number of subdomains
% K= number of DD iterations
%
% alpha= relaxation constant
% nn= size of subdomains
% nb= first index of subdomains
% ne= last index of subdomains
% index= matrix containing subdomain indices
%
% nnt= size of partitions
% nbt= first index of partitions
% net= last index of partitions
% index= matrix containing partition indices
%
% M= matrix
% y= right hand side vector
% xstore= solution to machine precision
%
% mpert= magnitude of "numerical errors" for each subdomain solve
% wpert= vector of "numerical errors" for each subdomain solve (length npK)
%

if sread == 0

    fprintf('Linear_system: Create linear system and solution strategy \n')

    % Fix size of system, number of subdomains and number of iterations
    n= 12;  % size of linear system
    p= 4;   % number of subdomains
    K= 6;   % number of DD iterations

    alpha= 0.5;

    % Fix domains
    nn= [3   6    6    4];  % size of subdomains
    nb= [1   2    5    9];  % first index of subdomains
    ne= [3   7   10   12];  % last index of subdomains

    % Fix partitions
    nnt= [3   3    4    2];  % size of partitions
    nbt= [1   4    7   11];  % first index of partitions
    net= [3   6   10   12];  % last index of partitions   
    
    % Fix linear system, matrix M and rhs y
    %rng shuffle
    rng(5)
    M= n/2*eye(n,n) + randn(n,n);
    y= randn(n,1);

    % Fix random "numerical errors"
    mpert= 0.01;
    wpert= randn(n*p*K,1);

elseif sread == 1

    fprintf('Linear_system: Read linear system and solution strategy \n')
    [n,p,K, alpha,nn,nb,ne, nnt,nbt,net, M,y, mpert,wpert]= input_from_files(input_file);

end


% Perform sanity check on subdomains
nn_check= ne-nb+1;
if norm(nn-nn_check) > 0
    fprintf('nn, nb, ne inconsistent')
    return
end

% Perform sanity check on partitions
nnt_check= net-nbt+1;
if norm(nnt-nnt_check) > 0
    fprintf('nnt, nbt, net inconsistent')
    return
end

% Perform sanity check on "numerical errors"
if length(wpert)-n*p*K ~= 0
    fprintf('wpert inconsistent with npK')
    return
end

% Construct index array to encode nn, nb and ne
nnmax= max(nn);
index= zeros(p,nnmax);
for i=1:p
    index(i,1:nn(i))= linspace(nb(i),ne(i),nn(i));
end

% Construct indext array to encode nnt, nbt and net
nntmax= max(nnt);
indext= zeros(p,nnmax);
for i=1:p
    indext(i,1:nnt(i))= linspace(nbt(i),net(i),nnt(i));
end


% Solve the linear system
x= M\y;
xstore= x;


if swrite == 1

    fprintf('Linear_system: Write linear system and solution strategy \n')
    output_to_files(n,p,K, alpha,nn,nb,ne, nnt,nbt,net,  M,y, mpert,wpert, output_file)

end


end

