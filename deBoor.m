function val = deBoor(ctrlPoints,t,degree,x)

[~,m]=size(t);
[dim,nbrPt] = size(ctrlPoints);

F=find(t<=x);
i = F(end)-1;

if(i>=degree-1 && i<nbrPt)
    val = boorP(degree-1,i,degree,x,t,ctrlPoints);
else
    val=zeros(dim,1);
end;