clear;
clc;
RGB1 = imread('Ornek_01.png'); %Ornek_01.png ad�ndaki resmi oku
figure, imshow(RGB1); %Resmi g�ster


I = rgb2gray(RGB1);%Renkli g�r�nt�y� gr�ye d�n��t�r�r
figure, imshow(I);%Olu�an gri resmin ��kt�s�n� verir


[rows, columns] = size(I); %I de�i�keni i�erisindeki dizinin
                           %sat�r ve s�tun de�erlerini rows ve columns de�i�kenlerine atar
histogram = zeros(1, 256);%1 den 256 ya kadar 0 lardan olu�an dizi d�nd�r�r.

for x=1:rows %sat�rlar� dola�
    for y=1:columns %s�tunlar� dola�
        i=I(x,y); %I dizisindeki eleman� i ye ata
            histogram(i)=histogram(i)+1; %histogram dizisinde i ye kar��l�k 
                                         %gelen sat�r� 1 artt�r. 
    end
end

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel de�erleri
bar(griSeviyeler,histogram, 'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Say�s�', 'FontSize', 20);
title('Histogram 0 - 255', 'FontSize', 20);
grid on;


bw = imcomplement(I);%resmin tersini alma
figure, imshow(bw);%resmi g�ster
histogram1 = zeros(1,256);%1 den 256 ya kadar 0 lardan olu�an dizi d�nd�r�r.

for i=1:256
for x=1:rows %sat�rlar� dola�
    for y=1:columns %s�tunlar� dola�
        if i==bw(x,y)%I dizisindeki eleman� i ye ata
            histogram1(i)=histogram1(i)+1; %histogram1 dizisinde i ye kar��l�k 
                                         %gelen sat�r� 1 artt�r. 
        end
    end
end
end

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel de�erleri
bar(griSeviyeler,histogram1,'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Say�s�', 'FontSize', 20);
title('Ters G�r�nt� Histogram 0 - 255', 'FontSize', 20);
grid on;