function [root,iter]=Ishfaqelahi_20238024(phi,dphi,x0,tol,max_iter)


if abs(dphi(x0))>=1
    error('Maf chai Matlab');
end

iter=0;
x=x0;
x_values=zeros(1,max_iter+1);
x_values(1)=x0;
while iter<max_iter
    x_new=phi(x);
    x_values(iter+2)=x_new;
    if abs(x_new-x)<tol
        root=x_new;
        break;
    end
    x=x_new;
    iter=iter+1;
    
end
if iter==max_iter
    root=x;
    fprintf("Matlab Warning reached without converge.\n");
end
x_values=x_values(1:iter+1);
fprintf("Root is %.4f",x);
figure;
plot(1:iter+1,x_values,'-o',LineWidth=1.5,Color="r");
xlabel("Iteration Number");
ylabel("x value");
title("Fixed Point Iteration Convergence");
%phi=@(x) 1/sqrt(1+x);

%dphi=@(x) -1/2*((1+x)^-3/2);"%tol=1e-6;
%max_iter=20;
%x0=0.5;