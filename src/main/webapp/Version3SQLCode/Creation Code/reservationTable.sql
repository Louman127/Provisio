CREATE TABLE IF NOT EXISTS reservation (

reservation_id INT NOT NULL AUTO_INCREMENT, 

PRIMARY KEY (reservation_id), 

hotel_id INT NOT NULL, 


user_id INT NOT NULL, 


CONSTRAINT reservation_fk_hotel_id 
FOREIGN KEY(hotel_id) REFERENCES hotel(hotel_id),

CONSTRAINT reservation_fk_user_id 
FOREIGN KEY(user_id) REFERENCES users(user_id),


check_in varchar(255) NOT NULL,
check_out varchar(255) NOT NULL, 
amenity_wifi BOOLEAN,
amenity_breakfast BOOLEAN,
amenity_parking BOOLEAN, 
room_size VARCHAR(255) NOT NULL,
room_amount VARCHAR(255) NOT NULL
);