taille_echantillon = 16;
frequence_echantillonnage = 44100;
frequence_echantillonnage =frequence_echantillonnage;

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


f = fit( [x, y], z, 'poly23' )

plot(f,[x,y],z);

t=192;
t=304;
t=361;
t=96;
t=456;
x=reshape(x,t,[]);
y=reshape(y,t,[]);
z=reshape(z,t,[]);

TG_inverse = [];

z(find(isnan(z)))=0;

for i = 1:size(z,2)
    A=real(ifft(z(:,i)));
	TG_inverse = [TG_inverse;A];		% Attention : TG_inverse doit etre un vecteur (ligne ou colonne)
end

%TG_inverse(abs(TG_inverse)>1)=1;
figure;
plot(TG_inverse)
sound(TG_inverse,frequence_echantillonnage,taille_echantillon);
%soundsc(TG_inverse,frequence_echantillonnage,taille_echantillon);