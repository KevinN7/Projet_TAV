close all;

n_c = 1; %freq coupure

Znan = ZZ; Znan(find(isnan(ZZ)))=0;

% Spectre:
spectre = fft2(Znan);
spectrecentre = fftshift(spectre);			% Permet de positionner l'origine (n_x,n_y) = (0,0) au centre

[nb_lignes,nb_colonnes]=size(ZZ);
[n_x,n_y] = meshgrid(1:nb_lignes,1:nb_colonnes);
n_x = (n_x-nb_lignes/2)/nb_lignes;	% Frequences dans l'intervalle [-0.5,0.5]
n_y = (n_y-nb_colonnes/2)/nb_colonnes;
passe_bas = (sqrt(n_x.*n_x+n_y.*n_y)<=n_c);% Frequence de coupure (faire varier ce parametre)

% Filtrage passe-bas :
S_b = passe_bas'.*spectrecentre;

S_i = ifft2(ifftshift(S_b));

figure;hold on;colormap(hot);
image(abs(Znan-S_i));
title('diff','FontSize',20);



%ZZrecons = abs(S_i);
ZZrecons = real(S_i);

figure;hold on;colormap(hot);
image(abs(Znan-ZZrecons));
title('diff','FontSize',20);

G= abs(ZZrecons-Znan);
find(G>0.001)

% figure()
% hold on;xlabel('X');ylabel('Y');zlabel('Z');
% surfl(XX,YY,abs(ZZrecons-Znan),[0 90])
% shading flat
% colormap gray
% axis on
% title('diff','FontSize',20);
% 
% figure;hold on;colormap(hot);
% image(abs(ZZrecons-Znan));
% title('diff','FontSize',20);
