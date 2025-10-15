-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- STEP ONE 
-- SELECT
--   id,         
--   date,      
--   type,      
--   location,   
--   description 
-- FROM crime_scene
-- WHERE location = 'West Hollywood Records';

-- STEP TWO 
-- SELECT
--   id,              
--   clue              -- THE CLUE WE WILL ACTULLY NEED 
-- FROM witnesses
-- WHERE crime_scene_id = (              
--   SELECT id                      
--   FROM crime_scene
--   WHERE location = 'West Hollywood Records'  
--     AND date = 19830715  
-- I TRIED TWO DIFFERENT WAYS TO ENTER THE NUMBERS  1983-07-15 & 1983/07/15          
-- );

-- RESULTS 
-- id	clue
-- 28	I saw a man wearing a red bandana rushing out of the store.
-- 75	The main thing I remember is that he had a distinctive gold watch on his wrist.

-- STEP THREE 
-- SELECT
--   id,             
--   name,           
--   bandana_color, 
--   accessory       
-- FROM suspects
-- WHERE bandana_color = 'red'        
--    AND accessory = 'gold watch'; 

-- RESULTS 
-- id	name	bandana_color	accessory
-- 35	Tony Ramirez	red	gold watch
-- 44	Mickey Rivera	red	gold watch
-- 97	Rico Delgado	red	gold watch

-- STEP FOUR
-- SELECT
--   interviews.suspect_id,     
--   interviews.transcript       
-- FROM interviews             
-- WHERE interviews.suspect_id IN (35, 44, 97);

-- Results
-- suspect_id	transcript
-- 35	I wasn't anywhere near West Hollywood Records that night.
-- 44	I was busy with my music career; I have nothing to do with this theft.
-- 97	I couldn't help it. I snapped and took the record.

-- SO ITS Rico Delgado






