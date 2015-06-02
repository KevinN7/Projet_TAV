clear all;
close all;

[V,F3,F4]=loadawobj('point_cloud.obj');
x = V(1,:)';
y = V(2,:)';
z = V(3,:)';

d=1;f=5000;
figure;
xlabel('x');
ylabel('y');
zlabel('z');
axis on
hold on;
plot3(x(d:f),y(d:f),z(d:f),'+');

figure;
hold on;
xlabel('x');
ylabel('z');
plot(x(d:f),z(d:f),'+');

figure;
hold on;
xlabel('y');
ylabel('z');
plot(y(:),z(:),'+');

figure;
hold on;
xlabel('x');
ylabel('y');
plot(x(:),y(:),'+');
