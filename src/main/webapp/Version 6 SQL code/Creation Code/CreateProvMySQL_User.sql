/* Log in your root account*/

/* Check current users */
SELECT host, user FROM mysql.user;

/* Create a new user to be used */
CREATE USER prov_user@localhost identified BY 'provisio';

/* Verify user was created */
SELECT host, user FROM mysql.user;

/* Grant it all privileges to databases and tables */
GRANT all ON *.* TO 'prov_user'@'localhost' WITH GRANT OPTION;

/* flush privileges to reload the grant tables */
flush privileges;