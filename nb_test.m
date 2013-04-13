function Ytestnb = test_bayes(Xtest, model)
Ytestnb=[];
[h l]=size(Xtest);%get the size of Xtest


for n=1:h
    
    N0=model{1,5}*prod(exp(-(Xtest(n,:)-model{1,1}).^2./(2*model{1,2}))./sqrt(2*pi*model{1,2}));
    %calculate the Guassian distribution of x|y=0
    N1=model{1,6}*prod(exp(-(Xtest(n,:)-model{1,3}).^2./(2*model{1,4}))./sqrt(2*pi*model{1,4}));
    %calculate the Guassian distribution of x|y=1
  if (N0/N1>1)%compare to make claasification
    Ytestnb=[Ytestnb;0];
  else
    Ytestnb=[Ytestnb;1];
  end
  
end

end

    