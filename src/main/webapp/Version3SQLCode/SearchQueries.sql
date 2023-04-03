/* Examples */

/* ********************* NEW ********************************* */

/* Query 1 - This will display reservation_id, hotel_id, user_id, check-in, check-out, amenities, room_size, and room_amount */
SELECT * FROM reservation WHERE reservation.user_id;


/* Query 2 - This will display reservation and user_id's that are associated with one another showing the users information. 
It shows reservation_id, hotel_id, user_id, first_name, last_name, email, phone, country, zip, pass, loyalty_points */
SELECT reservation.reservation_id, reservation.hotel_id, users.* from reservation inner join users on reservation.user_id = users.user_id;


/* Query 3 - This is the same as Query 2 but omits the users password */ 
SELECT reservation.reservation_id, reservation.hotel_id, users.user_id, users.first_name, users.last_name, users.email, users.phone, users.country, users.zip, users.loyalty_points 
from reservation inner join users on reservation.user_id = users.user_id;


/* Query 4 - This will show the reservation_id, hotel_id, hotel_name, user_id, first_name, last_name, email, phone, country, zip, and loyalty_points */
SELECT  reservation.reservation_id, reservation.hotel_id, hotel.hotel_name, users.user_id, users.first_name, users.last_name, users.email, users.phone, users.country, users.zip, users.loyalty_points 
from reservation join users on reservation.hotel_id = users.user_id join hotel on reservation.hotel_id = hotel.hotel_id;
