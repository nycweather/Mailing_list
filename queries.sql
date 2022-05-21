CREATE TABLE USERS(
    EMAIL VARCHAR(255) PRIMARY KEY,
    CREATED_AT TIMESTAMP DEFAULT NOW()
);


#EARLIEST USER THAT JOINED THE MAILING LIST
SELECT * FROM USERS ORDER BY CREATED_AT LIMIT 1;

#MONTHLY USER JOINED
SELECT Monthname(created_at) AS month, 
       Count(*)              AS count 
FROM   users 
GROUP  BY month 
ORDER  BY count DESC; 

#Total yahoo users
SELECT Count(*) AS yahoo_users 
FROM   users 
WHERE  email LIKE '%@yahoo.com'; 

#Count up different email platforms
SELECT CASE 
         WHEN email LIKE '%@gmail.com' THEN 'gmail' 
         WHEN email LIKE '%@yahoo.com' THEN 'yahoo' 
         WHEN email LIKE '%@hotmail.com' THEN 'hotmail' 
         ELSE 'other' 
       end      AS provider, 
       Count(*) AS total_users 
FROM   users 
GROUP  BY provider 
ORDER  BY total_users DESC; 