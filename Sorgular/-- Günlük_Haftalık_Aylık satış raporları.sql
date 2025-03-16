-- Günlük/Haftalýk/Aylýk satýþ raporlarý
SELECT COUNT(*) AS satis_sayisi, SUM(toplam_tutar) AS toplam_gelir, CONVERT(DATE, siparis_tarihi) AS tarih
FROM Siparisler 
WHERE siparis_tarihi BETWEEN '2025-04-01' AND '2025-04-10'
GROUP BY CONVERT(DATE, siparis_tarihi);
