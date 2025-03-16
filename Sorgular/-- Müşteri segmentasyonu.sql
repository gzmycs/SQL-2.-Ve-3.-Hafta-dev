-- M��teri segmentasyonu
SELECT kullanici_id, COUNT(*) AS siparis_sayisi, CASE 
WHEN COUNT(*) > 10 THEN 'VIP' 
WHEN COUNT(*) BETWEEN 5 AND 10 THEN 'S�k M��teri' 
ELSE 'Yeni M��teri' END AS segment
FROM Siparisler GROUP BY kullanici_id;
