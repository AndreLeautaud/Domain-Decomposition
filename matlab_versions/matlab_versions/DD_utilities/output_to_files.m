function output_to_files(n,p,K, alpha,nn,nb,ne, nnt,nbt,net,  M,y, mpert,wpert, output_file)

data(1,1)= n;
data(2,1)= p;
data(3,1)= K;

data(4,1)= alpha;

data(5,1:p)= nn;
data(6,1:p)= nb;
data(7,1:p)= ne;

data(8,1:p)= nnt;
data(9,1:p)= nbt;
data(10,1:p)= net;

data(11:10+n,1:n)= M;
data(11+n:10+2*n,1)= y;

data(11+2*n,1)= mpert;
data(12+2*n:11+2*n+n*p*K,1)= wpert;

writematrix(data,['Inputs/',output_file,'.csv'],'WriteMode','overwrite')

end