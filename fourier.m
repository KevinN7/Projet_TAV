close all;

n_c = 0.02; %freq coupure

Znan = ZZ;
Znan(find(isnan(ZZ)))=0;

disp('Affichage du re-echantillonage initiale')
figure()
hold on;xlabel('X');ylabel('Y');zlabel('Z');
surfl(XX,YY,Znan,[0 90])
shading flat
colormap gray
axis on


% Spectre:
spectre = fft2(Znan);
spectrecentre = fftshift(spectre);			% Permet de positionner l'origine (n_x,n_y) = (0,0) au centre

% Affichage du logarithme du module du spectre de I :
figure;
imagesc(log(abs(spectrecentre)));
axis equal;
axis ij;
axis off;
colormap gray;
title('Spectre','FontSize',20);

[nb_lignes,nb_colonnes]=size(ZZ);
% Frequences en x et en y (axes = repere matriciel) :
[n_x,n_y] = meshgrid(1:nb_lignes,1:nb_colonnes);
n_x = (n_x-nb_lignes/2)/nb_lignes;	% Frequences dans l'intervalle [-0.5,0.5]
n_y = (n_y-nb_colonnes/2)/nb_colonnes;

% Filtre passe-bas :
passe_bas = (sqrt(n_x.*n_x+n_y.*n_y)<=n_c);% Frequence de coupure (faire varier ce parametre)

% Filtrage passe-bas :
S_b = passe_bas'.*spectrecentre;
figure;
imagesc(log(abs(S_b)));
axis equal;
axis ij;
axis off;
colormap gray;
title('Spectre + filtre Passe Bas','FontSize',20);

S_i = ifft2(ifftshift(S_b));

figure;
hold on;
colormap(hot);
imagesc(log(abs(S_i)));
axis equal;
axis ij;
axis off;
colormap gray;
title('Reconstruction','FontSize',20);

%ZZrecons = abs(S_i);
ZZrecons = real(S_i);

figure()
hold on;xlabel('X');ylabel('Y');zlabel('Z');
surfl(XX,YY,ZZrecons,[0 90])
shading flat
colormap gray
axis on
title('Reconstruction Surface','FontSize',20);

G= abs(ZZrecons-Znan);
length(find(G>0.01))

figure()
hold on;xlabel('X');ylabel('Y');zlabel('Z');
surfl(XX,YY,abs(ZZrecons-Znan),[0 90])
shading flat
colormap gray
axis on
title('diff','FontSize',20);

figure;hold on;colormap(hot);
imagesc(abs(ZZrecons-Znan));
title('diff','FontSize',20);


disp('Sono');
taille_echantillon = 16;
frequence_echantillonnage = 44100;

TG_inverse = [];

echantillons = [zeros(91,size(XX,2));ZZrecons];
%echantillons = ZZrecons;
for i = 1:size(XX,2)
	TG_inverse = [TG_inverse;real(ifft(echantillons(:,i)))];		% Attention : TG_inverse doit etre un vecteur (ligne ou colonne)
end

figure;
plot(TG_inverse)
sound(TG_inverse,frequence_echantillonnage,taille_echantillon);
