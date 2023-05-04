-- Email validation to sent 
CREATE TRIGGER change_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    DECLARE valid_email INT;
    CALL sp_TransferData(valid_email);
    IF valid_email < 0 THEN
        SET NEW.email = OLD.email;
    END IF;
END;