-- Kategori bazlý satýþ raporlarý
SELECT k.ad AS kategori_adi, COUNT(*) AS satis_sayisi, SUM(toplam_tutar) AS toplam_gelir
FROM Siparisler s JOIN Sepet sp ON s.siparis_id = sp.sepet_id
JOIN Urunler u ON sp.urun_id = u.urun_id
JOIN Kategoriler k ON u.kategori_id = k.kategori_id
GROUP BY k.ad;
