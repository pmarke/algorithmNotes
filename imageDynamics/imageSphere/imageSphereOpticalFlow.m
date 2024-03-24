


fov_x = pi/2;   % field of view x in radians
fov_y = pi/2;   % field of view y in radiens


% 1/2 the field of view
fov_x_half = fov_x/2;  
fov_y_half = fov_y/4;

max_x = tan(fov_x_half); % max x coordinate on image plane
max_y = tan(fov_y_half); % max y coordinate on image plane

num_points = 100;
x = linspace(-max_x,max_x,num_points);
x_max = ones(1,num_points)*max_x;
y_max = ones(1,num_points)*max_y;
y = linspace(-max_y,max_y,num_points);
z = -ones(1,num_points);
ze = zeros(1,num_points);

axisLength = 2;
[X,Y,Z] = sphere;
figure(1),clf;
surf(X,Y,Z,'FaceAlpha',0.5,'EdgeColor','interp');
hold on;

plot3([0,-axisLength],[0,0],[0,0],'r')
plot3([0,0],[0,axisLength],[0,0],'g')
plot3([0,0],[0,0],[0,-axisLength],'b')


% Draw plane
patch([1;1;0]*max_x,[1;-1;0]*max_y,[-1;-1;0],[1]);
patch([-1;-1;0]*max_x,[1;-1;0]*max_y,[-1;-1;0],[1]);
patch([-1;1;0]*max_x,[1;1;0]*max_y,[-1;-1;0],[1]);
patch([-1;1;0]*max_x,[-1;-1;0]*max_y,[-1;-1;0],[1]);
patch([1;-1;-1;1]*max_x,[1;1;-1;-1]*max_y,[-1;-1;-1;-1],[1,1,1,1])

%%
% This integrates the lower hemisphere. 


syms phi th real
x = sin(th)*cos(phi);
y= sin(th)*sin(phi);
z= cos(th);

X = [x;y;z];


fov_x = pi;
fov_y = pi;
Gamma = int(int(X*sin(th),th,0,pi/2),phi,0,2*pi);

Q=(eye(3)-X*X')*cos(th)*sin(th);
Q = simplify(Q);

PHI = int(Q,th,0,fov_x/2);
PHI = int(Qi,phi,0,2*pi);
