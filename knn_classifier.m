[Y,X,w]=gen_synthetic(1000,10,0,0.001);
alpha=0.9;%train-text ratio
Y(Y==-1)=0;
Ynewtrain=Y(1:floor(alpha*length(Y)),:);
Ynewtest=Y(floor(alpha*length(Y))+1:length(Y),:);
Xnewtrain=X(1:floor(alpha*size(X,1)),:);
Xnewtest=X(floor(alpha*size(X))+1:size(X,1),:);
train=[Xnewtrain,Ynewtrain];
test=[Xnewtest,Ynewtest];
%���ѵ�������Ͳ��������ĸ��� 
[m,n]=size(train) 
[m1,n1]=size(test) 
answer=zeros(m1,1); 
for i=[1:1:m1] 
    sim=zeros(m,2); 
    %����ÿһ�������������ֱ��������ÿһ��ѵ�������ľ��� 
    for j=1:1:m 
        sim(j,1)=knnsim(test(i,1:2),train(j,1:2)); 
        sim(j,2)=train(j,3); 
    end 
    %�Լ�������Ľ���������� 
    [simtemp,index]=sort(sim(:,1)); 
    sim(:,2)=sim(index,2); 
    sim(:,1)=simtemp; 
    %�ҳ���ѵ��������Ϊ�ӽ�5������������������һ���ࣨ��Ϊ����־Ϊ0��1������ֻҪ�жϾ��������5��������ֵ���Ƿ����2�Ϳ���֪����� 
    flag=sum(sim((m-4):m,2)); 
    if flag>2 
        answer(i)=1; 
    else 
        answer(i)=0; 
    end     
end 
%�г����в��������ķ����� 
answer 