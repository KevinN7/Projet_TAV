% clear all;
% close all;

seuil = 30;

[V,F3,F4]=loadawobj('point_cloud.obj');
x = V(1,:)';
y = V(2,:)';
z = V(3,:)';

nbPts = length(x);

IndicesDebutSeq = [1];
for i=1:nbPts-1
    if( abs(y(i+1)-y(i))>seuil )
        IndicesDebutSeq = [IndicesDebutSeq (i+1)];
    end;
end;

nbSeq = length(IndicesDebutSeq);
lengthSeq = [];
for i=1:(nbSeq-1)
    lengthSeq = [lengthSeq (IndicesDebutSeq(i+1)-IndicesDebutSeq(i))];
end

%find(lengthSeq~=192) seul les 3 premières sequences ont une longueur diff
%de 192
x = x(IndicesDebutSeq(4):end);
y = y(IndicesDebutSeq(4):end);
z = z(IndicesDebutSeq(4):end);


f = fit( [x, y], z, 'lowess')
%'linearinterp''smoothingspline''cubicinterp''lowess'
plot(f,[x,y],z);

% x=reshape(x,192,[]);
% y=reshape(y,192,[]);
% z=reshape(z,192,[]);


M(:,:,1) = x(:,:);
M(:,:,2) = y(:,:);
M(:,:,3) = z(:,:);




% %Spline
% 
% m=3;
% [N1,N2,~] = size(M);
% t1=0:(N1+m);
% t2=0:(N2+m);
% t1=t1/(N1+m);
% t2=t2/(N2+m);
% 
% figure;
% hold on;
% umax=200;
% vmax=200;
% Iu = 0:umax;
% Iv= 0:vmax;
% for u=Iu
%     u/umax
%     for v=Iv
%         P = bSplineSurfDeBoor(M,deg,t1,t2,u/umax,v/vmax);
%         H(u+1,v+1,:)=P;
%     end;
% end;
% 
% surf(H(:,:,1),H(:,:,2),H(:,:,3));






% %Spline
% 
% deg=2;
% nbr=5;
% 
% P = subSpline(M,deg,nbr);
% 
% figure;hold on;
% % plot3(tore(:,:,1),tore(:,:,2),tore(:,:,3),'LineWidth',2);
% % plot3(tore(:,:,1)',tore(:,:,2)',tore(:,:,3)','LineWidth',2);
% surf(P(:,:,1),P(:,:,2),P(:,:,3));

% k=1;
% for i=1:
%     for j=1:192
%         M(i,j,1) = x(k);M(:,2)=y(k);M(:,3)=z(k);
%         k=k+1;
%     end;
% end;
% x = reshape(x,190,[]);

% M = zeros(nbPts,3);
% M(:,1) = x;M(:,2)=y;M(:,3)=z;

% H = reshape(M)



% %Spline
% 
% m=3;
% [N1,N2,~] = size(exemple);
% t1=0:(N1+m);
% t2=0:(N2+m);
% t1=t1/(N1+m);
% t2=t2/(N2+m);
% 
% figure;
% hold on;
% umax=400;
% vmax=400;
% Iu = 0:umax;
% Iv= 0:vmax;
% for u=Iu
%     for v=Iv
%         P = bSplineSurfDeBoor(tore,deg,t1,t2,u/umax,v/vmax)
%         H(u+1,v+1,:)=P;
%     end;
% end;
% 
% surf(H(:,:,1),H(:,:,2),H(:,:,3));