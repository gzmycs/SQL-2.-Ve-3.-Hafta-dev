-- Müþteri sadakat analizi
SELECT kullanici_id, COUNT(*) AS siparis_sayisi FROM Siparisler GROUP BY kullanici_id HAVING COUNT(*) > 2;