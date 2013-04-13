function model = nb_train(Xtrain, Ytrain, attributes)
Y=Ytrain;
X=Xtrain;

   U0=mean(X(Y==0,:));%calculate the mean when Y=0
   W0=var(X(Y==0,:));%calculate the varience when Y=0
   U1=mean(X(Y==1,:));%calculate the mean when Y=1
   W1=var(X(Y==1,:));%calculate the varience when Y=1
   Y0=sum(1 - Y)/size(Y,1);%calculate the ratio of Y=0
   Y1=sum (Y)/size(Y,1);%calculate the ratio of Y=1


model={U0,W0,U1,W1,Y0,Y1};
end