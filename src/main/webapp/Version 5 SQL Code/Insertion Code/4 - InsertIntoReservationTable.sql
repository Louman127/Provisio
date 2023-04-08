/* This code inserts the users into the reservation table because it is using their user_id INT */

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('3', '01/01/2023', '01/02/2023', '3', '0', '1','0','5', '3', '$100');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('2', '04/03/2023', '04/05/2023', '1', '1', '1','1','7', '2', '$1');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('5', '05/03/2023', '05/05/2023', '3', '0', '0','0','4', '1', '$2');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('6', '10/03/2023', '10/05/2023', '3', '1', '0','1','2', '4','$3099');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('1', '12/03/2023', '12/05/2023', '2', '1', '1','0','3', '4', '$500');

INSERT INTO `provisio_db`.`reservation`(`user_id`, `check_in`, `check_out`, `hotel_id`, `amenity_wifi`, `amenity_breakfast`, `amenity_parking`, `number_of_guests`, `room_id`, `price_total`) 
VALUES('4', '08/03/2023', '08/05/2023', '3', '1', '0','1','4', '4', '$200');