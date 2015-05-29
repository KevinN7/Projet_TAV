% Charger les points 3D
disp('Chargement des points');
[V,F3,F4]=loadawobj('point_cloud.obj');
x = V(1,:)';
y = V(2,:)';
z = V(3,:)';
clear V F3 F4

% Fitting d'un plan sur les points 3D 
% Estimer C tel que :
% z = x * C(1) + y*C(2) + C(3);
disp('Estimation du plan moyen')
N = length(x);
Un = ones(N,1);
C = [x y Un]\z;

% Echantillonage de points sur le plan moyen
disp('Echantillonage du plan moyen')
zPlane = C(1)*x+C(2)*y + C(3);

% Affichage des points et du plan moyen
disp('Affichage des points 3D et du plan moyen')
figure()
plot3(x,y,z,'r+');
hold on
plot3(x,y,zPlane,'b+')

% Re-echantillonage
disp('Re-echantillonage')
nb_points = 1000;
pas = (max(x(:))-min(x(:)))/nb_points;
[XX,YY] = meshgrid(min(x(:)):pas:max(x(:)),min(y(:)):pas:max(y(:)));
ZZ = griddata(x,y,z-zPlane,XX,YY,'natural');

% Affichage du re-echantillonage
disp('Affichage du re-echantillonage')
figure()
surfl(XX,YY,ZZ,[0 90])
shading flat
colormap gray
axis off

