function solution_compare(xstore,vstore,wstore,zstore,iprint)
%
%  Compare solutions (multiplicative Schwarz)
%

nx=length(xstore);
nv=length(vstore);

fprintf('Difference between xstore and vstore \n')
if iprint >=4
    (xstore(1:nx,1)-vstore(nv-nx+1:nv,1))'
end
norm(xstore(1:nx,1)-vstore(nv-nx+1:nv,1))

fprintf('Difference between vstore and wstore \n')
if iprint >=4
    (vstore-wstore)'
end
norm(vstore-wstore)

fprintf('Difference between wstore and zstore \n')
if iprint >=4
    (wstore-zstore)'
end
norm(wstore-zstore)


fprintf('Difference between vstore and zstore \n')
if iprint >=4 0
    (vstore-zstore)'
end
norm(vstore-zstore)

end

