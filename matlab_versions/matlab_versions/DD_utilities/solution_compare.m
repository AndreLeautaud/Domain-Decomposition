function solution_compare(xstore,vglobal,vstore,wstore,zstore,iprint)
%
%  Compare solutions
%

nx= length(xstore);
nv= length(vstore);

fprintf('\nComparing solutions \n')
fprintf('norm(exact-iterative) = %13.6e \n', norm(xstore(1:nx,1)-vglobal(1:nx,1)) )
fprintf('norm(vstore-wstore)   = %13.6e \n', norm(vstore-wstore))
fprintf('norm(wstore-zstore)   = %13.6e \n', norm(wstore-zstore))
fprintf('norm(vstore-zstore)   = %13.6e \n', norm(vstore-zstore) )

if iprint >=6
    (xstore(1:nx,1)-vstore(nv-nx+1:nv,1))'
    (vstore-wstore)'
    (wstore-zstore)'
    (vstore-zstore)'
end

end
