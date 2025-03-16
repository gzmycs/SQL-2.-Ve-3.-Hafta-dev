-- Satýþ Raporu Stored Procedure'ü
CREATE PROCEDURE sp_SalesReport @StartDate DATE, @EndDate DATE
AS BEGIN
    SELECT COUNT(*) AS satis_sayisi, SUM(toplam_tutar) AS toplam_gelir FROM Siparisler WHERE siparis_tarihi BETWEEN @StartDate AND @EndDate;
END;