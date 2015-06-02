function res = bSplineSurfDeBoor(Pts,deg,t1,t2,u,v)

[n,m,~] = size(Pts);

for i=1:n
	pts(:,1:3) = Pts(i,:,1:3);
    h(1:3,i) = deBoor(pts',t1,deg,u);
end;

res = deBoor(h,t2,deg,v);