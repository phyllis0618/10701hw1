[Y,X,w]=gen_synthetic(1000,10,0,0.001);
alpha=0.9;%train-text ratio
Y(Y==-1)=0;
Ynewtrain=Y(1:floor(alpha*length(Y)),:);
Ynewtest=Y(floor(alpha*length(Y))+1:length(Y),:);
Xnewtrain=X(1:floor(alpha*size(X,1)),:);
Xnewtest=X(floor(alpha*size(X))+1:size(X,1),:);
train=[Xnewtrain,Ynewtrain];
test=[Xnewtest,Ynewtest];
%获得训练样本和测试样本的个数 
[m,n]=size(train) 
[m1,n1]=size(test) 
answer=zeros(m1,1); 
for i=[1:1:m1] 
    sim=zeros(m,2); 
    %对于每一个测试样本，分别计算它与每一个训练样本的距离 
    for j=1:1:m 
        sim(j,1)=knnsim(test(i,1:2),train(j,1:2)); 
        sim(j,2)=train(j,3); 
    end 
    %对计算出来的结果进行排序 
    [simtemp,index]=sort(sim(:,1)); 
    sim(:,2)=sim(index,2); 
    sim(:,1)=simtemp; 
    %找出与训练样本最为接近5个样本，并它属于哪一个类（因为类别标志为0和1，所以只要判断距离最近的5个点的类别值和是否大于2就可以知道类别） 
    flag=sum(sim((m-4):m,2)); 
    if flag>2 
        answer(i)=1; 
    else 
        answer(i)=0; 
    end     
end 
%列出所有测试样本的分类结果 
answer 