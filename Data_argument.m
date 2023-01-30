%% ��ͨ�� ת��Ϊ��ͨ��
clc;
clearvars;
close all;
fold1='C:\Users\ys\Desktop\winter\һ�ֻ��ں���������ǿ�Ŀ��¶ȶκ���ͼ��У������\data8\';
fold2='C:\Users\ys\Desktop\winter\һ�ֻ��ں���������ǿ�Ŀ��¶ȶκ���ͼ��У������\label8\';
refold1='C:\Users\ys\Desktop\winter\һ�ֻ��ں���������ǿ�Ŀ��¶ȶκ���ͼ��У������\augdata\2\';
refold2='C:\Users\ys\Desktop\winter\һ�ֻ��ں���������ǿ�Ŀ��¶ȶκ���ͼ��У������\augresult\2\';
if exist(refold1,'dir') == 0
     mkdir(refold1);
end

if exist(refold2,'dir') == 0
     mkdir(refold2);
end

all=10;
Q=2;

imperty_orig='png';imperty_goal='png';dot='.';
imgDir1 = dir([fold1 ['*',dot,imperty_orig]]); 
imgDir2 = dir([fold2 ['*',dot,imperty_orig]]); 
img1=zeros(512,640,8);
img2=zeros(512,640,8);
for i=1:length(imgDir1)
    img = imread([fold1 imgDir1(i).name]);
    name=struct2cell(imgDir1(i));
    name=name{1,1};%��ȡÿ��ͼƬ������
    name= strrep(name,[dot,imperty_orig],'');%��ȥ�ַ����е�ͼ���ʽ
    img1(:,:,i)=img;

%     figure(1);imshow(uint8(img1(:,:,i)),[]);

end

for i=1:length(imgDir2)
    img = imread([fold2 imgDir2(i).name]);
    name=struct2cell(imgDir2(i));
    name=name{1,1};%��ȡÿ��ͼƬ������
    name= strrep(name,[dot,imperty_orig],'');%��ȥ�ַ����е�ͼ���ʽ
    img2(:,:,i)=img;

%     figure(2);imshow(uint8(img2(:,:,i)),[]);

end



for i=1:all
    data=zeros(512,640);
    label=zeros(512,640);
    for j=1:Q:512
%     for j=1:2:128
       for k=1:Q:640
%        for k=1:2:128
       
       Aim_x=[j,j+Q-1];
       Aim_y=[k,k+Q-1];
       a=round(rand(1,1)*7)+1; 
       
       
       
       select1=img1(:,:,a);
       select2=img2(:,:,a);
%        �Ѿ��������Ԫ��ȡ��
       data(Aim_x(1):Aim_x(2),Aim_y(1):Aim_y(2))=select1(Aim_x(1):Aim_x(2),Aim_y(1):Aim_y(2));
       label(Aim_x(1):Aim_x(2),Aim_y(1):Aim_y(2))=select2(Aim_x(1):Aim_x(2),Aim_y(1):Aim_y(2));
             
       end          
        
    end
    figure(1);imshow(uint8(data),[]);
    imwrite(uint8(data),[refold1,num2str(i),dot,imperty_goal],imperty_goal); 
    imwrite(uint8(label),[refold2,num2str(i),dot,imperty_goal],imperty_goal); 
    i
end