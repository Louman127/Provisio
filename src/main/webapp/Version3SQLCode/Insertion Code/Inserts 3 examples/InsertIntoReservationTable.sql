/* This code inserts the users into the reservation table because it is using their user_id INT */

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `room_size`, `room_amount`) 
VALUES('3', '01/01/2023', '01/02/2023', '1', '0', '1','0','King', '127.99');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `room_size`, `room_amount`) 
VALUES('2', '01/01/2023', '01/02/2023', '2', '1', '1','1','Two Double', '139.99');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `room_size`, `room_amount`) 
VALUES('1', '01/01/2023', '01/02/2023', '3', '0', '1','1','Suite', '202.99');