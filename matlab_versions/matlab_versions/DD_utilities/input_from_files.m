function [n,p,K, alpha,nn,nb,ne, nnt,nbt,net, M,y, mpert,wpert]= input_from_files(input_file)

data= readmatrix(['Inputs/',input_file,'.csv']);

n= data(1,1);
p= data(2,1);
K= data(3,1);

alpha= data(4,1);

nn= data(5,1:p);
nb= data(6,1:p);
ne= data(7,1:p);

nnt= data(8,1:p);
nbt= data(9,1:p);
net= data(10,1:p);

M= data(11:10+n,1:n);
y= data(11+n:10+2*n,1);

mpert= data(11+2*n,1);
wpert= data(12+2*n:11+2*n+n*p*K,1);

end