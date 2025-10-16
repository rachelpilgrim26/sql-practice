-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?
--  STEP ONE 
-- SELECT
--   id,          
--   date,        
--   location, 
--   description  
-- FROM crime_scene
-- WHERE location = 'Coral Bay Marina'
--   AND date = 19860814;  

-- RESULT 
-- id	date	location	description
-- 43	19860814	Coral Bay Marina	The body of an unidentified man was found near the docks.
--   Two people were seen nearby: one who lives on 300ish "Ocean Drive" 
--   and another whose first name ends with "ul" and his last name ends with "ez".


-- STEP TWO 
-- SELECT id, name, address
-- FROM person
-- WHERE address LIKE '%Ocean Drive%'; 

-- Results
-- id	name	address
-- 1	Marco Romano	22 Ocean Drive
-- 5	Michael Santos	33 Ocean Drive
-- 62	Jesse Brooks	234 Ocean Drive
-- 101	Carlos Mendez	369 Ocean Drive
-- 105	Victor Martinez	33 Ocean Drive

-- STEP THREE 
-- SELECT id, name, address
-- FROM person
-- WHERE name LIKE '%ul %ez';

-- Results
-- id	name	address
-- 102	Raul Gutierrez	45 Sunset Ave

-- I DIDNT GET WHAT I WANTED ?

-- STEP FOUR 
-- SELECT 
--   person.id,           
--   person.name,         
--   interviews.transcript
-- FROM interviews
-- JOIN person
--   ON person.id = interviews.person_id
-- WHERE person.id IN (102, 105, 101);  

-- Results
-- id	name	transcript
-- 101	Carlos Mendez	I saw someone check into a hotel on August 13. The guy looked nervous.
-- 102	Raul Gutierrez	I heard someone checked into a hotel with "Sunset" in the name.
-- 105	Victor Martinez	I didn’t do anything. Ask Raul. He knows more.


