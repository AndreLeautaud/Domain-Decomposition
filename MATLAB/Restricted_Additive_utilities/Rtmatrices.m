function [Rt] = Rtmatrices(R,n,p,nn,nnt,index,indext,iprint)
%
% Create R matrix  
% Rt= 3D matrix containing 2D restriction "RRt" matrices for each of the p subdomains
%
% Note: Because Rt(i) must be of size n x nn(i) it cannot be constructed in the same fashion as R(i) 
% since this would result in a matrix of size n x nnt(i)
%

nnmax= max(nn);
Rt= zeros(p,nnmax,n);
RRt= zeros(nnmax,n);
RR= zeros(nnmax,n);

for i=1:p
    RR(1:nnmax,1:n)= R(i,1:nnmax,1:n);
    RRt= zeros(nnmax,n);
    for j=1:nn(i)
        for k=1:nnt(i)
            if index(i,j)==indext(i,k)
                RRt(j,1:n)= RR(j,1:n);
            end  
        end
    end
    Rt(i,1:nnmax,1:n)= RRt(1:nnmax,1:n);
end

if iprint >= 4
    for i=1:p
        tmp=zeros(nnmax,n);
        fprintf('Rtmatrices: matrix R on subdomain %3i \n',i)
        tmp(1:nn(i),1:n)= R(i,1:nn(i),1:n);
        disp(tmp(1:nn(i),1:n))
    end
    for i=1:p
        tmp=zeros(nnmax,n);
        fprintf('Rtmatrices: matrix Rt on subdomain %3i \n',i)
        tmp(1:nn(i),1:n)= Rt(i,1:nn(i),1:n);
        disp(tmp(1:nn(i),1:n))
    end
end

end

