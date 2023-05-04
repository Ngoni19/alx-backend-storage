-- Create a trigger that decreases quantity
CREATE TRIGGER DelQ
AFTER INSERT ON orders
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number
WHERE NEW.item_name = name;

