-- En �ok al��veri� yapan m��teriler
SELECT kullanici_id, COUNT(*) AS siparis_sayisi, SUM(toplam_tutar) AS toplam_harcama
FROM Siparisler GROUP BY kullanici_id ORDER BY toplam_harcama DESC;
