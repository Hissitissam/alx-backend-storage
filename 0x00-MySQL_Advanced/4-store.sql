-- Drop the trigger if it already exists
DROP TRIGGER IF EXISTS reduce_quantity;

DELIMITER //

CREATE TRIGGER reduce_quantity
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;  -- Ensure item_name and name are correct and aligned
END //

DELIMITER ;