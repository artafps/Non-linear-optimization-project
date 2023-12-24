clc
clear all
n=input('n=');
Q=rand(n)
Q=Q'*Q+10.^(-5)*eye(n)
b=rand(n,1);
k=10 ;%iteration ;
ep=10^-5;
x0=rand(n,1);
f=@(x)1/2*x'*Q*x+b'*x;

re=[];
err=1;
i=0;
while err>ep
% for i=1:k
%     gk=Q*x0+b;
%     alp=gk'*gk/(gk'*Q*gk);
%     x1=x0-alp*gk;
%     re=[re; i f(x1)-f(x0)];
%     x0=x1;
% end
 gk=Q*x0+b;
 alp=1;s=3/4;eps=0.9;
     while f(x0-alp*gk)>f(x0)-eps*alp*gk'*gk
        alp=s*alp;
     end
    x1=x0-alp*gk;
    i=i+1;
   err=norm(x1-x0);
    re=[re; i err f(x1)-f(x0)];
    x0=x1;
end