%PreProcess
%Input X has row as sample and col as feature then
function [X,Y]=preprocess(Xraw,Yraw)
    [h w]=size(Xraw);
    me=repmat(mean(Xraw),h,1);
    st=repmat(std(Xraw),h,1);
    X=(Xraw-me)./st;
    Y=Yraw;
    Y(Yraw~=1)=0;
end