-- Stok Raporu Stored Procedure'�
CREATE PROCEDURE sp_StockReport
AS BEGIN
    SELECT * FROM Urunler WHERE stok < 10;
END;
