A = randn(2,2);
A = diag([1,0.1]);
A = A'*A;
R = chol(A,'lower');
[Q,L] = eig(A)
Ai = inv(A)


%%
figure(1),clf;
mu = [0 0];
sigma = A;
x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2);
X = [X1(:) X2(:)];
y = mvnpdf(X,mu,sigma);
y = reshape(y,length(x2),length(x1));
contour(x1,x2,y,[0.0001 0.001 0.01 0.05 0.15 0.25 0.35])
xlabel('x')
ylabel('y')
line([0 0 1 1 0],[1 0 0 1 1],'Linestyle','--','Color','k')
hold on
plot(R(1,1),R(2,1),'*r')
plot(R(1,2),R(2,2),'*r')
plot(-R(1,1),-R(2,1),'*r')
plot(-R(1,2),-R(2,2),'*r')
plot(sqrt(L(1,1))*Q(1,1),sqrt(L(1,1))*Q(2,1),'*m')
plot(sqrt(L(2,2))*Q(1,2),sqrt(L(2,2))*Q(2,2),'*m')
plot(-sqrt(L(1,1))*Q(1,1),-sqrt(L(1,1))*Q(2,1),'*m')
plot(-sqrt(L(2,2))*Q(1,2),-sqrt(L(2,2))*Q(2,2),'*m')