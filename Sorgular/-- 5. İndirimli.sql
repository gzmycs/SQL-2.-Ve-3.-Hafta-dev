-- 5. �ndirimli �r�nler
SELECT * FROM Urunler WHERE fiyat < (SELECT AVG(fiyat) FROM Urunler);