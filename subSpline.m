function res = subSpline(Pts,deg,nbr)


[n,m,~]=size(Pts);
for i =1:m
    Pt(:,1:3) = Pts(:,i,1:3);
    K(1:3,:) = subdiv(Pt',deg,nbr);
    h(i,:,1:3) = K(1:3,:)';
end;

[~,l] = size(K);

for i=1:l
    Pt(:,1:3) = h(:,i,1:3);
    K(1:3,:) = subdiv(Pt',deg,nbr);
    res(:,i,1:3) = K(1:3,:)';
end;
