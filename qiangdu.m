%���ϲ�����ѧ��ǿ��������㣬����Ԥ����ϼ���ǿ��
%���������
n=32
%Q=[141.9 3.06 0;3.06 8.66 0;0 0 5.0];����նȾ���  HT3/5224����
for ii=1:n
    Q(:,:,ii)=[141.9 3.06 0;3.06 8.66 0;0 0 5.0];   
end
S=zeros(3,3);%������Ⱦ���
A=zeros(3,3);%��ϰ�նȾ���
elt=zeros(3,1,n),exy=zeros(3,1,n),sgmlt=zeros(3,1,n),sgmxy=zeros(3,1,n);%sgm��ʾӦ���ң�lt��ʾ������xy��ʾ��������
fai=[45 45 -45 -45 45 45 -45 -45 45 45 -45 -45 45 45 -45 -45 -45 -45 45 45 -45 -45 45 45 -45 -45 45 45 -45 -45 45 45];%��������xy����ļн�
%m=cos(fai),n=sin(fai);
%T=[m*m n*n 2*m*n;n*n m*m -2*m*n;-m*n m*n m*m-n*n];%sgmlt=T*sgmxy
Qba=zeros(3,3,n);%�ǲ��������򵥲�նȾ���(kΪ����)

Qba=QQ(Q,fai);
%S=inv(Q);��ʱ�ò���S
%N��MΪ���غ�
N=[0;0;0];

M=[500;0;0];
exy0=zeros(1,3),kai=zeros(1,3);
t=4/32;
k=16;

%fai=[0,90,0,90,0,90,0,90,90,0,90,0,90,0,90,0];
aQba=AA(Qba,t,-k+1,k);
bQba=BB(Qba,t,-k+1,k);
dQba=DD(Qba,t,-k+1,k);

A=sumMAtrix(aQba,-k+1,k);
B=sumMAtrix(bQba,-k+1,k);
D=sumMAtrix(dQba,-k+1,k);

%inv(A)*b����A\b��b*inv(A)����b/A
B2=-A\B;
C2=B/A;
D2=D-B*inv(A)*B;
a=inv(A)-B2*inv(D2)*C2;
b=B2/inv(D2);
%c=-D2\C2;
c=b';
d=inv(D2);
exy0=a*N+b*M;
kai=c*N+d*M;
for kk=-k+1:k
   exy(:,:,kk+k)=exy0+(kk+kk-1)*t*kai/2; 
   sgmxy(:,:,kk+k)=Qba(:,:,kk+k)*exy(:,:,kk+k);
   m=cosd(fai(kk+k));
   n=sind(fai(kk+k));
   T=[m^2 n^2 2*m*n;n^2 m^2 -2*m*n;-m*n m*n m^2-n^2];
   sgmlt(:,:,kk+k)=T*sgmxy(:,:,kk+k);
   kk=kk+1; 
end













