function F=sumMAtrix(A,low,up)
%size(A,3)���Եõ�A�ĵ���ά�ĳ���
F=zeros(3,3);
n=up-low+1;
for i=1:n
    F=A(:,:,i)+F;   
end