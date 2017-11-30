function y =myperceptron(i,theta,p)
 v=p(i,:)*theta';
 if (v>0)
     y=1;
 else 
     y=0;
 end
 


end

