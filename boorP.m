function val = boorP(k,i,degree,x,knots,ctrlPoints)
%i dans 0..
%k dans 0..
    if(k==0)
        res = ctrlPoints(:,i+1);
    else
        alpha = (x-knots(i+1))/(knots(i+1+degree-k)-knots(i+1));
        res = boorP(k-1,i-1,degree,x,knots,ctrlPoints)*(1-alpha)+boorP(k-1,i,degree,x,knots,ctrlPoints)*alpha ;
    end;
    
    val =res;