-- Sipariþ Durumu Güncelleme Procedure'ü
CREATE PROCEDURE sp_UpdateOrderStatus @OrderID INT, @NewStatus VARCHAR(50)
AS BEGIN
    UPDATE Siparisler SET siparis_tarihi = GETDATE() WHERE siparis_id = @OrderID;
END;
