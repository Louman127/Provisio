CREATE TABLE IF NOT EXISTS hotel (

hotel_id INT NOT NULL AUTO_INCREMENT, 

PRIMARY KEY (hotel_id),

hotel_name VARCHAR(255), 
country VARCHAR(255), 
street_address VARCHAR(255),
state_location VARCHAR(255),
city VARCHAR(255),
zip VARCHAR(255),
phone VARCHAR(255)

);