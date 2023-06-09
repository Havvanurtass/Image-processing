clear;
clc;
RGB1 = imread('Ornek_01.png'); %Ornek_01.png adındaki resmi oku
figure, imshow(RGB1); %Resmi göster


I = rgb2gray(RGB1);%Renkli görüntüyü grüye dönüştürür
figure, imshow(I);%Oluşan gri resmin çıktısını verir


[rows, columns] = size(I); %I değişkeni içerisindeki dizinin
                           %satır ve sütun değerlerini rows ve columns değişkenlerine atar
histogram = zeros(1, 256);%1 den 256 ya kadar 0 lardan oluşan dizi döndürür.

for x=1:rows %satırları dolaş
    for y=1:columns %sütunları dolaş
        i=I(x,y); %I dizisindeki elemanı i ye ata
            histogram(i)=histogram(i)+1; %histogram dizisinde i ye karşılık 
                                         %gelen satırı 1 arttır. 
    end
end

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel değerleri
bar(griSeviyeler,histogram, 'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Sayısı', 'FontSize', 20);
title('Histogram 0 - 255', 'FontSize', 20);
grid on;

figure;
griSeviyeler = 0 : 255;%0'dan 255'e kadar piksel değerleri
d=mat2gray(griSeviyeler); %0-255 arasında olan matris 0-1 aralığına ölçeklendi
bar(d,histogram,'BarWidth', 1, 'FaceColor', 'k');
xlabel('Gri Renkler', 'FontSize', 20);
ylabel('Piksel Sayısı', 'FontSize', 20);
title('Histogram 0 - 1', 'FontSize', 20);
grid on;
