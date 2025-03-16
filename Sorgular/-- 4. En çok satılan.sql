-- 4. En çok satýlan ürünler
SELECT urun_id, COUNT(*) AS satis_sayisi FROM Siparisler
JOIN Sepet ON Siparisler.siparis_id = Sepet.sepet_id
GROUP BY urun_id ORDER BY satis_sayisi DESC;