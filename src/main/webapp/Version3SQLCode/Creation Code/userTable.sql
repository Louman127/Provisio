CREATE TABLE IF NOT EXISTS users (

user_id INT NOT NULL AUTO_INCREMENT, 

PRIMARY KEY(user_id), 

first_name VARCHAR(255), 
last_name VARCHAR(255),
email VARCHAR(255), 
phone VARCHAR(25), 
country VARCHAR(255), 
zip VARCHAR(255),
pass VARCHAR(255), 
loyalty_points INT);