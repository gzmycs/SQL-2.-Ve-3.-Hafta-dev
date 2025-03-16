-- Stok Raporu Stored Procedure'ü
CREATE PROCEDURE sp_StockReport
AS BEGIN
    SELECT * FROM Urunler WHERE stok < 10;
END;
