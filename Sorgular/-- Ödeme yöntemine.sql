-- �deme y�ntemine g�re sipari� raporlar�
SELECT odeme_yontemi, COUNT(*) AS siparis_sayisi, SUM(tutar) AS toplam_tutar FROM Odemeler GROUP BY odeme_yontemi;