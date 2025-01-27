CREATE DATABASE  CarDealership;

USE CarDealership;


CREATE TABLE  Cars (
    car_id INT PRIMARY KEY ,   
    make VARCHAR(255),                        
    model VARCHAR(255),                      
    year INT,                                
    price DECIMAL(10, 2),                    
    is_available BOOLEAN,                     
    added_date DATE                          
);


DELIMITER $$

CREATE PROCEDURE InsertCar(
    IN p_make VARCHAR(255),                  
    IN p_model VARCHAR(255),                 
    IN p_year INT,                          
    IN p_price DECIMAL(10, 2),              
    IN p_is_available BOOLEAN,              
    IN p_added_date DATE                    
)
BEGIN
    INSERT INTO Cars (make, model, year, price, is_available, added_date)
    VALUES (p_make, p_model, p_year, p_price, p_is_available, p_added_date);
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetAllCars()
BEGIN
    SELECT * FROM Cars;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE UpdateCarDetails(
    IN p_car_id INT,                       
    IN p_make VARCHAR(255),                
    IN p_model VARCHAR(255),               
    IN p_year INT,                         
    IN p_price DECIMAL(10, 2),             
    IN p_is_available BOOLEAN,             
    IN p_added_date DATE                   
)
BEGIN
    UPDATE Cars
    SET 
        make = p_make,
        model = p_model,
        year = p_year,
        price = p_price,
        is_available = p_is_available,
        added_date = p_added_date
    WHERE car_id = p_car_id;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE DeleteCar(
    IN p_car_id INT 
)
BEGIN
    DELETE FROM Cars WHERE car_id = p_car_id;
END $$

DELIMITER ;


CALL InsertCar(
    
    'Toyota',                 
    'Corolla',                
    2020,                    
    20000.00,                
    TRUE,                   
    '2025-01-27'              
);


CALL GetAllCars();

CALL UpdateCarDetails(
    1,                      
    'Toyota',              
    'Camry',               
    2021,                  
    25000.00,              
    TRUE,                  
    '2025-01-27'           
);


CALL DeleteCar(1);

SELECT * FROM Cars;
