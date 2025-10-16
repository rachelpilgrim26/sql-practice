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
-- HE WASNT THE KILLER 
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

-- STEP FIVE 
-- SELECT person.id, person.name, confessions.confession
-- FROM confessions
-- JOIN person ON person.id = confessions.person_id
-- WHERE person.id IN (101, 102, 105);

-- Results
-- id	name	confession
-- 101	Carlos Mendez	This is just a misunderstanding.
-- 102	Raul Gutierrez	Alright! I've been running a blackmail operation.
-- 105	Victor Martinez	Alright! I confess to the extortion scheme.

STEP SIX

-- SELECT
--   person.id,                        
--   person.name,                      
--   hotel_checkins.hotel_name,       
--   hotel_checkins.check_in_date,     
--   surveillance_records.suspicious_activity 
-- FROM surveillance_records
-- JOIN person
--   ON person.id = surveillance_records.person_id
-- LEFT JOIN hotel_checkins
--   ON hotel_checkins.id = surveillance_records.hotel_checkin_id
-- WHERE hotel_checkins.hotel_name LIKE '%Sunset%'
--   AND hotel_checkins.check_in_date BETWEEN 19860813 AND 19860814;


-- Results
-- id	name	hotel_name	check_in_date	suspicious_activity
-- 2	Antonio Costa	Sunset Shore Hotel	19860813	NULL
-- 3	Vincent Rossi	Sunset Shores Resort	19860813	Used the hotel gym
-- 5	Michael Santos	Sunset View Inn	19860813	NULL
-- 6	James Wilson	Sunset Coast Inn	19860813	Spotted entering late at night
-- 8	Thomas Brown	Sunset Bay Hotel	19860813	Left suddenly at 3 AM
-- 12	George Davis	Sunset View Resort	19860813	NULL
-- 14	Richard Moore	Sunset Dunes Inn	19860813	NULL
-- 15	Joseph Taylor	Sunset Grove Inn	19860813	Asked for directions to beach
-- 17	Christopher Lee	Sunset Oasis Resort	19860813	NULL
-- 20	Brian Hall	Sunset Isle Inn	19860813	Used concierge service
-- 24	Jason Adams	Sunset Marina Resort	19860813	

-- then i just plugged in the 3am left and he was it
-- thomas brown



