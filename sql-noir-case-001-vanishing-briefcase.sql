-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- FIRST STEP 
-- -- SELECT
--   id,        
--   date,        
--   type,        
--   location,   
--   description 
-- FROM crime_scene
-- WHERE location = 'Blue Note Lounge';  

-- Results
-- id	date	type	location	description
-- 76	19851120	theft	Blue Note Lounge	
--   A briefcase containing sensitive documents vanished. 
--   A witness reported a man in a trench coat with a scar on his left cheek fleeing the scene.

--SECOND STEP
-- SELECT
--   id,        
--   name,      
--   attire,    
--   scar       
-- FROM suspects
-- WHERE attire = 'trench coat';

-- Results
-- id	name	attire	scar
-- 3	Frankie Lombardi	trench coat	left cheek
-- 183	Vincent Malone	trench coat	left cheek
-- 237	Christopher Black	trench coat	right cheek

--THIRD STEP
-- SELECT
--   suspect_id,   
--   transcript  
-- FROM interviews 
-- WHERE suspect_id IN (3, 183, 237) 
-- ORDER BY suspect_id;          

-- RESULTS
--   suspect_id	transcript
-- 3	NULL
-- 183	I wasn’t going to steal it, but I did.

-- SO ITS Vincent Malone 




