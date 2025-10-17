-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?


-- STEP ONE

-- SELECT
--   id AS crime_record_id,                   
--   date AS crime_date_integer,              
--   location AS crime_location_text,         
--   description AS crime_description_text   
-- FROM crime_scene                           
-- WHERE location LIKE '%Fontainebleau%'      
--   OR description LIKE '%Heart of Atlantis%'; 

-- Results
-- id	date	location	description
-- 48	19870520	Fontainebleau Hotel	The Heart of Atlantis necklace disappeared.
--   Many guests were questioned but only two of them gave valuable clues. 
--   One of them is a really famous actor. 
--   The other one is a woman who works as a consultant for a big company and her first name ends with "an".

-- STEP TWO 
-- SELECT
--   id,
--   name,
--   occupation
-- FROM guest
-- WHERE occupation LIKE '%consult%';

-- RESULTS WAS LONG SO I NEED TO GET MORE DETAILED 
  
-- STEP THREE
-- SELECT guest.id, guest.name, guest.occupation 
--   FROM guest JOIN witness_statements
--   ON guest.id = witness_statements.guest_id 
--   WHERE guest.occupation 
--   LIKE '%actor%' OR (guest.occupation LIKE '%consult%' AND guest.name LIKE '%an');


-- Results
-- id	name	occupation
-- 129	Clint Eastwood	Actor

-- STEP FOUR 
-- SELECT
--   id,
--   name,
--   occupation
-- FROM guest
-- WHERE occupation LIKE '%consult%'
--   AND name LIKE '%an %';

-- Results
-- id	name	occupation
-- 116	Vivian Nair	Consultant

-- STEP 5
-- SELECT
--   guest.name,
--   witness_statements.clue
-- FROM witness_statements
-- JOIN guest
--   ON guest.id = witness_statements.guest_id
-- WHERE guest.name = 'Clint Eastwood'
--    OR (guest.occupation LIKE '%consult%' AND (guest.name LIKE '%an %' OR guest.name LIKE '%an'))
-- ORDER BY guest.name;



-- Results
-- Clint Eastwood	I overheard someone say, "Meet me at the marina, dock 3.
-- Vivian Nair	I saw someone holding an invitation ending with "-R".
--   He was wearing a navy suit and a white tie.

-- STEP 6 
--   guest.name,
--   attire_registry.note
-- FROM attire_registry
-- JOIN guest
--   ON guest.id = attire_registry.guest_id
-- WHERE attire_registry.note LIKE '%navy%'
--   OR attire_registry.note LIKE '%white tie%';

-- RESULTS TO MANY SO I NARROWED IT DOWN 

-- STEP 7 
-- SELECT
--   marina_rentals.id,
--   marina_rentals.dock_number,
--   marina_rentals.rental_date,
--   marina_rentals.boat_name,
--   guest.id,
--   guest.name
-- FROM marina_rentals
-- JOIN guest
--   ON guest.id = marina_rentals.renter_guest_id
-- WHERE marina_rentals.dock_number = 3
--   AND marina_rentals.rental_date = 19870520;


-- RESULTS AGIAN TO LONG 
-- id	dock_number	rental_date	boat_name	id	name
-- 4	3	19870520	Coastal Dream	45	Violet Ward
-- 9	3	19870520	Sea Serenade	112	Atlas Owens
-- 14	3	19870520	Blue Pearl	78	Phoenix Mason
-- 19	3	19870520	Wave Seeker	145	Eden Todd
-- 24	3	19870520	Wind Song	167	Luna Dalton
-- 29	3	19870520	Marina Belle II	78	Phoenix Mason
-- 34	3	19870520	Ocean Spirit	190	Atlas Roach
-- 39	3	19870520	Sunset Mist	78	Phoenix Mason
-- 44	3	19870520	Coastal Spirit	105	Mike Manning
-- 49	3	19870520	Sea Spray	34	Felix Morgan

-- STEP 8 
-- SELECT DISTINCT
--   guest.id,
--   guest.name,
--   guest.invitation_code
-- FROM guest
-- JOIN attire_registry
--   ON attire_registry.guest_id = guest.id
-- WHERE guest.invitation_code LIKE '%R'
--   AND attire_registry.note LIKE '%navy%'
--   AND attire_registry.note LIKE '%white tie%';



-- STEP 9
-- SELECT DISTINCT
--   guest.name,
--   guest.invitation_code,
--   marina_rentals.boat_name,
--   marina_rentals.dock_number,
--   marina_rentals.rental_date
-- FROM guest
-- JOIN attire_registry
--   ON attire_registry.guest_id = guest.id
-- JOIN marina_rentals
--   ON marina_rentals.renter_guest_id = guest.id
-- WHERE guest.invitation_code LIKE '%R'
--   AND attire_registry.note LIKE '%navy%'
--   AND attire_registry.note LIKE '%white tie%'
--   AND marina_rentals.dock_number = 3
--   AND marina_rentals.rental_date = 19870520;

-- RESULT 
-- Results
-- name	invitation_code	boat_name	dock_number	rental_date
-- Mike Manning	VIP-R	Coastal Spirit	3	19870520







