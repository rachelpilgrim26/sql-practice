-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS


--Crime scene report
SELECT date, type, description, city
FROM crime_scene_report
WHERE date= '20180115' AND type= 'murder' AND city = 'SQL City';

--Annabel Miller is the witness what's the information
SELECT * FROM person WHERE name LIKE '%Annabel%';

--found that annable was onn that street
SELECT * FROM person
WHERE name LIKE '%Annabel%' AND address_street_name = 'Franklin Ave';

-- Annabel Millers interview what she seen
SELECT * FROM interview WHERE person_id = '16371';

--she saw a murder happen at the gym while working out
SELECT * FROM get_fit_now_member WHERE name LIKE '%Annabel%';

--Now look into when she saw the murder happen
SELECT * FROM get_fit_now_check_in WHERE membership_id = ‘90081’;

--Hours check into the gym 1600 - 1700
SELECT * FROM get_fit_now_check_in WHERE check_in_date = ‘20180109’ AND check_in_time = 1600 OR check_out_time = 1700;
-- Two people who are the suspects
--Jeremy Bowers
--Joe Germuska
--Answer!
---Jeremy Bowers was the culprit

--BONUS:
--Jeremy Bowers was the hitman but who did it for real
--he had interview spoke about a woman
SELECT * FROM drivers_license WHERE hair_color = 'red' AND height BETWEEN '65' AND '67' AND car_make = 'Tesla';

--There are 3  woman that could have done it 
SELECT * FROM person WHERE license_id = '202298' OR license_id = '291182' OR license_id = '918773';

-- but who was at the facebook event 
SELECT * FROM facebook_event_checkin
WHERE event_name LIKE '%Symphony%' AND person_id = '99716';
-- answer 
--Miranda Priestly made the kill!
