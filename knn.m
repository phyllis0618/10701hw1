function Ytestknn = knn(Xtrain, Ytrain, Xtest, attributes, k)
[m n]=size(Xtrain);
[mt nt]=size(Xtest);
Ytestknn=zeros(mt,1);
if(attributes==1)
    for n=1:mt %Line-by-line comparison
       
        Xt=Xtest(n,:);
        repmatXt=repmat(Xt,m,1);%copy Xt to the same size as the train matrix
        dis=sqrt(sum((repmatXt-Xtrain).^2,2));% calculate distance use Euclidean distance
        [~, TX]=sort(dis);% sort the distance
        flag=sum(Ytrain(TX(1:k)))/k;% select the kth near distance 
        if(flag>0.5)%calculate the and make classification
            yf=1;
        else
            yf=0;
        end
        Ytestknn(n)=yf;   
     
    end
else
end
        
        