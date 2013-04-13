%load x.xlsx, y.xlsx
%X=x.xlsx;
%Y=y.xlsx;

RecC1=[];
RecC2=[];
RecC3=[];
for k=1:2:49
%for rho=0.1:0.1:0.8
%for p = 2:2:40    
%[Y,X,w]=gen_synthetic(400,p,0.1,0.001);
%Y(Y==-1)=0;

alpha=1;%train-text ratio
%Y(Y==-1)=0;
Xnew=Xreal(1:floor(alpha*length(Xreal)),:);
Ynew=Yreal(1:floor(alpha*length(Yreal)),:);
%{
Ynewtrain=Y(1:floor(alpha*length(Y)),:);
Ynewtest=Y(floor(alpha*length(Y))+1:length(Y),:);
Xnewtrain=X(1:floor(alpha*size(X,1)),:);
Xnewtest=X(floor(alpha*size(X))+1:size(X,1),:);
%}

%for k=1:2:49;
indices=crossvalind('Kfold',size(Xnew,1),10);%k-fold validation, divide into k package

n1=0;%initial n1
n2=0;%initial n2
n3=0;%initial n3
 for a=1:10
 %for k=1:10
test = (indices == a);%select test package
 train = ~test;%create train package according to test package
    Xnewtrain=Xnew(train,:);
 Ynewtrain=Ynew(train,:);
        Xnewtest=Xnew(test,:);
 Ynewtest=Ynew(test,:);


model = nb_train(Xnewtrain, Ynewtrain, 1);

Ytestnb = nb_test(Xnewtest,model);

CorrectRatio1=(length(find(Ytestnb-Ynewtest~=0)))/(length(Ytestnb));
%disp(CorrectRatio1);
n1=n1+CorrectRatio1;

Ytestknn = knn(Xnewtrain, Ynewtrain, Xnewtest, 1, k);
%Ytrainknn = knn(Xnewtrain, Ynewtrain, Xnewtrain, 1, 9);

CorrectRatio2=(length(find(Ytestknn-Ynewtest~=0)))/(length(Ytestknn));
%disp(CorrectRatio2);
n2=n2+CorrectRatio2;

%CorrectRatio3=(length(find(Ytrainknn-Ynewtrain~=0)))/(length(Ytrainknn));
%disp(CorrectRatio2);
%n3=n3+CorrectRatio3;
 end
 
 C1=n1/10
 C2=n2/10
 %C3=n3/10
 RecC1=[RecC1 C1];
 RecC2=[RecC2 C2];
 %RecC3=[RecC3 C3];

 
end


figure;
plot(1:2:49,RecC2','g-.*');
legend('KNN');
%xlabel('k');
%ylabel('error');
%title('test and train error');
%legend('test error','train error');
xlabel('k');
ylabel('test error');
title('test error with different distance');
 
