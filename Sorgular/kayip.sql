-- Kay�p m��teri analizi
SELECT kullanici_id FROM Siparisler WHERE siparis_tarihi < DATEADD(MONTH, -6, GETDATE());
