clear;
clc;
RGB1 = imread('Ornek_01.png'); %Ornek_01.png adýndaki resmi oku
figure, imshow(RGB1); %Resmi göster


I = rgb2gray(RGB1);%Renkli görüntüyü grüye dönüþtürür
figure, imshow(I);%Oluþan gri resmin çýktýsýný verir


[rows, columns] = size(I); %I deðiþkeni içerisindeki dizinin
                           %satýr ve sütun deðerlerini rows ve columns deðiþkenlerine atar
histogram = zeros(1, 256);%1 den 256 ya kadar 0 lardan oluþan dizi döndürür.

for x=1:rows %satýrlarý dolaþ
    for y=1:columns %sütunlarý dolaþ
        i=I(x,y); %I dizisindeki elemaný i ye ata
            histogram(i)=histogram(i)+1; %histogram dizisinde i ye karþýlýk 
                                         %gelen satýrý 1 arttýr. 
    end
end

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel deðerleri
bar(griSeviyeler,histogram, 'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Sayýsý', 'FontSize', 20);
title('Histogram 0 - 255', 'FontSize', 20);
grid on;


bw = imcomplement(I);%resmin tersini alma
figure, imshow(bw);%resmi göster
histogram1 = zeros(1,256);%1 den 256 ya kadar 0 lardan oluþan dizi döndürür.

for i=1:256
for x=1:rows %satýrlarý dolaþ
    for y=1:columns %sütunlarý dolaþ
        if i==bw(x,y)%I dizisindeki elemaný i ye ata
            histogram1(i)=histogram1(i)+1; %histogram1 dizisinde i ye karþýlýk 
                                         %gelen satýrý 1 arttýr. 
        end
    end
end
end

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel deðerleri
bar(griSeviyeler,histogram1,'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Sayýsý', 'FontSize', 20);
title('Ters Görüntü Histogram 0 - 255', 'FontSize', 20);
grid on;