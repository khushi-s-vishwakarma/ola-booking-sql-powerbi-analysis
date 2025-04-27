use ola;
-- 1. Retrieve all successful bookings:
CREATE VIEW Successful_bookings AS
    SELECT 
        *
    FROM
        booking_details
    WHERE
        booking_status = 'success';
----- main answer
SELECT 
    *
FROM
    Successful_bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
    SELECT 
        AVG(Ride_Distance), vehicle_Type
    FROM
        booking_details
    GROUP BY vehicle_Type;

SELECT 
    *
FROM
    ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
SELECT 
    *
FROM
    booking_details;
SELECT 
    COUNT(*) AS `total cancelled rides by customer`
FROM
    booking_details
WHERE
    Canceled_Rides_by_Customer IS NOT NULL;
    
SELECT COUNT(*) FROM booking_details WHERE Booking_Status = 'canceled by Customer';

-- 4. List the top 5 customers who booked the highest number of rides:
SELECT DISTINCT
    (customer_id), COUNT(customer_id) AS counts
FROM
    booking_details
GROUP BY customer_id
ORDER BY counts DESC
LIMIT 5;



-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT 
    COUNT(Canceled_Rides_by_Driver) AS counts
FROM
    booking_details
WHERE
    Canceled_Rides_by_Driver = 'personal & car related issue';

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT 
    MAX(Driver_Ratings) AS maximum,
    MIN(Driver_Ratings) AS minimum
FROM
    booking_details
WHERE
    vehicle_Type = 'Prime Sedan';

-- 7. Retrieve all rides where payment was made using UPI:
SELECT 
    *
FROM
    booking_details
WHERE
    payment_Method = 'UPI';

-- 8. Find the average customer rating per vehicle type:
SELECT 
    vehicle_type, AVG(customer_Rating)
FROM
    booking_details
GROUP BY vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT 
    SUM(booking_value)
FROM
    booking_details
WHERE
    booking_status = 'Success';

-- 10. List all incomplete rides along with the reason:
SELECT 
    booking_id,
    booking_status,
    vehicle_type,
    incomplete_rides,
    Incomplete_Rides_Reason
FROM
    booking_details
WHERE
    Incomplete_Rides = 'Yes';
