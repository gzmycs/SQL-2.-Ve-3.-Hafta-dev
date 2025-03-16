-- 5. Ýndirimli ürünler
SELECT * FROM Urunler WHERE fiyat < (SELECT AVG(fiyat) FROM Urunler);