clc;
clear;
I=imread('Ornek_08.png');
figure,imshow(I),title('Orijinal Resim');
figure, bar(imhist(I),'FaceColor','k'),title('Orijinal Resim Histogram�');


ID=double(I);%Orijinal resmin de�erlerini double a �evir
B=padarray(ID,[1 1]);%eklenecek dolgu miktar�n� belirtir.
LI=zeros(size(ID));%1.filtre i�in ��kt�
LI1=zeros(size(ID));%2.filtre i�in ��kt�

F1=[0 1 0;1 -4 1;0 1 0];%Filtre1
F2=[-1 -1 -1 ;-1 9 -1;-1 -1 -1];%Filtre2

%Filtre1 Uygulanmas�
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
       
        LI(i,j)=sum(sum(F1.*B(i:i+2,j:j+2)));%2.derece t�rev 
        
     end
end

LI=uint8(LI);%matrisin veri tipi double ��kt��� i�in [0,255] aras� de�erlere uint8'e �evirir
figure,imshow(LI),title('Filtre1 Resim');%filtre1 uygulanan resmin ��kt�s�
%Ojinal g�r�nt�den Laplacian yap�lan g�r�nt�n�n filtre1 ��kar�lmas� 
KG=I-LI;
figure,imshow(KG),title('Orjinal-Filtre1 Resim');
figure, bar(imhist(LI),'FaceColor','k'),title('Filtre1 Resim Histogram�');


%%Filtre2 Uygulanmas� 
for i=1:size(B,1)-2
    for j=1:size(B,2)-2
        LI1(i,j)=sum(sum(F2.*B(i:i+2,j:j+2)));
    end
end

LI1=uint8(LI1);%matrisin veri tipi double ��kt��� i�in [0,255] aras� de�erlere uint8'e �evirir
figure,imshow(LI1),title('Filtre2 Resim');

%Ojinal g�r�nt�den Laplacian yap�lan g�r�nt�n�n filtre2 ��kar�lmas� 
KG2=I-LI1;
figure,imshow(KG2),title('Orjinal-Filtre2');
figure,bar(imhist(LI1),'FaceColor','k'),title('Filtre2 Resim Histogram�');

