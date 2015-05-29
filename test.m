taille_echantillon = 16;
frequence_echantillonnage = 44100;

TG_inverse = [];

ZZ(find(isnan(ZZ)))=0;

for i = 1:size(XX,2)
	TG_inverse = [TG_inverse;real(ifft(ZZ(:,i)))];		% Attention : TG_inverse doit etre un vecteur (ligne ou colonne)
end

sound(TG_inverse,frequence_echantillonnage,nombre_bits);