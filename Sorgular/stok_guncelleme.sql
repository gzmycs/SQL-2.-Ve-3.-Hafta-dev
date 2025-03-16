-- Stok Güncelleme Trigger'ý
CREATE TRIGGER tr_UpdateStock ON Sepet AFTER INSERT AS BEGIN
    UPDATE Urunler SET stok = stok - (SELECT adet FROM inserted WHERE inserted.urun_id = Urunler.urun_id);
END;
