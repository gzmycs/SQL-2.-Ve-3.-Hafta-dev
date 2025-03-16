-- Stok maliyeti raporu
SELECT SUM(fiyat * stok) AS toplam_stok_maliyeti FROM Urunler;