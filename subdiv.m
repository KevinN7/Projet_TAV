function res = subdiv(PtsCtrl,degres,nbr)

if(nbr==0)
    res = PtsCtrl(:,:);
else
    [dim,n] = size(PtsCtrl);
    
    %Dedoublement des points de controle
    repet = zeros(dim,n);
    for i = 1:n
        repet(:,2*i-1) = PtsCtrl(:,i);
        repet(:,2*i) = PtsCtrl(:,i);
    end;
    
    %Milieu successif
    h=2*n-1;
    for i = 1:degres
        mil = zeros(dim,h);
        for k = 1:h
            mil(:,k) = 0.5*(repet(:,k)+repet(:,k+1));
        end;
        repet = mil;
        h=h-1;
    end;
    
    res = subdiv(mil(:,1:h+1),degres,nbr-1);
end;