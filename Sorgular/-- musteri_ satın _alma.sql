-- M��teri sat�n alma davran��lar�
SELECT kullanici_id, AVG(toplam_tutar) AS ortalama_harcama FROM Siparisler GROUP BY kullanici_id;