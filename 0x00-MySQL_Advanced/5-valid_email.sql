-- Email validation to sent 
CREATE TRIGGER change_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    DECLARE result_code INT;
    CALL sp_TransferData(result_code);
    IF result_code < 0 THEN
        SET NEW.email = OLD.email;
    END IF;
END;