use expedition;
CREATE TABLE scientist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    speciality VARCHAR(50),
    nationality VARCHAR(50)
);

CREATE TABLE expedition (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    start_date DATE,
    end_date DATE,
    team_lead_id INT,
    FOREIGN KEY (team_lead_id) REFERENCES scientist(id)
);

CREATE TABLE sighting (
    id INT PRIMARY KEY AUTO_INCREMENT,
    expedition_id INT NOT NULL,
    scientist_id INT NOT NULL,
    animal_type VARCHAR(50) NOT NULL,
    count INT NOT NULL,
    sighting_date DATE,
    location_lat DECIMAL(10, 7),
    location_long DECIMAL(10, 7),
    FOREIGN KEY (expedition_id) REFERENCES expedition(id),
    FOREIGN KEY (scientist_id) REFERENCES scientist(id)
);

INSERT INTO scientist(name,speciality,nationality) VALUES 
('Dr. Aris Thorne', 'Marine Biology', 'Canadian'),
('Dr. Elara Vance', 'Ornithology', 'British'),
('Dr. Lena Petrova', 'Zoology', 'Russian'),
('Dr. Evelyn Reed', 'Marine Biology', 'American'),
('Dr. Ben Carter', 'Ecology', 'British'),
('Dr. Mei Chen', 'Botany', 'Chinese'),
('Dr. Samuel Hayes', 'Ornithology', 'Canadian'),
('Dr. Hiroshi Tanaka', 'Seismology', 'Japanese'),
('Dr. Anya Sharma', 'Geology', 'Indian'),
('Dr. James Peterson', 'Climatology', 'American'),
('Dr. Sophie Dubois', 'Botany', 'French'),
('Dr. Carlos Rivera', 'Ecology', 'Mexican'),
('Dr. Maria Schmidt', 'Marine Biology', 'German'),
('Dr. Kaiya Adams', 'Ornithology', 'Australian'),
('Dr. Liam O\'Connell', 'Zoology', 'Irish'),
('Dr. Fatima Al-Farsi', 'Astrophysics', 'Omani'),
('Dr. Noah Kim', 'Mycology', 'Korean');


INSERT INTO expedition(name,region,start_date,end_date,team_lead_id)
VALUES ('Expedition Aurora 2024', 'Arctic', '2024-03-01', '2024-05-15', 1),
('Icebreaker 2023', 'Antarctic', '2023-11-20', '2024-01-25', 2),
('North Pole Trek 2025', 'Arctic', '2025-04-10', '2025-04-20', 3),
('Coral Reef Census 2025', 'Great Barrier Reef', '2025-03-15', '2025-04-20', 1),
('Amazon Biodiversity Survey', 'Amazon Rainforest', '2025-06-01', '2025-08-30', 2),
('Arctic Seabird Watch', 'Arctic Circle', '2025-07-10', '2025-07-25', 4),
('Desert Sands Survey 2024', 'Sahara Desert', '2024-09-01', '2024-09-30', 9),     
('Andean Peaks Study 2025', 'Andes Mountains', '2025-01-10', '2025-02-15', 10),    
('Borneo Rainforest Initiative', 'Borneo Rainforest', '2024-10-15', '2024-12-20', 4), 
('Great Lakes Monitoring', 'Great Lakes', '2025-05-01', '2025-05-30', 5),         
('Galapagos Marine Reserve', 'Galapagos Islands', '2025-08-01', '2025-09-15', 12),
('Australian Outback Flora', 'Australian Outback', '2024-07-01', '2024-07-21', 11),
('Arctic Ice Core Drilling', 'Greenland', '2023-08-01', '2023-10-30', 10),        
('African Savannah Census', 'Serengeti', '2025-09-10', '2025-10-15', 14),         
('Project Ghost Study 2026', 'Remote Siberia', '2026-01-01', '2026-03-01', 3);


INSERT INTO sighting(expedition_id,scientist_id,animal_type,count,sighting_date,location_lat,location_long)
VALUES (1, 1, 'Polar Bear', 2, '2024-03-10', 74.50, -100.12),
 (1, 2, 'Arctic Tern', 45, '2024-03-11', 74.61, -100.05),
(2, 4, 'Emperor Penguin', 150, '2023-12-01', -64.12, -58.90),
(2, 1, 'Humpback Whale', 5, '2023-12-05', -64.55, -59.22),
(2, 4, 'Seal', 12, '2024-01-10', -63.99, -58.50),
(3, 3, 'Narwhal', 1, '2025-04-12', 85.10, 10.00),
(1, 1, 'Narwhal', 3, '2024-04-20', 78.21, 15.64),
(4, 5, 'Clownfish', 50, '2025-03-22', -19.1356, 146.9018),
(4, 6, 'Sea Turtle', 5, '2025-03-24', -19.1400, 146.9100),
(5, 6, 'Jaguar', 1, '2025-06-15', -3.4653, -58.3842),
(5, 7, 'Capybara', 12, '2025-06-18', -3.4500, -58.3900),
(6, 8, 'Puffin', 200, '2025-07-14', 70.4500, -22.1000),
(1, 1, 'Arctic Fox', 5, '2024-03-15', 74.55, -100.20),
(1, 4, 'Ringed Seal', 8, '2024-03-20', 75.00, -99.80),
(2, 2, 'Blue Whale', 1, '2023-12-10', -65.00, -60.00),
(2, 4, 'Leopard Seal', 3, '2024-01-05', -64.20, -58.80),
(3, 3, 'Polar Bear', 1, '2025-04-14', 85.20, 10.50),
(4, 1, 'Manta Ray', 2, '2025-03-25', -19.1500, 146.9200),
(4, 5, 'Sea Cucumber', 100, '2025-03-28', -19.1600, 146.9000),
(4, 6, 'Dugong', 1, '2025-04-01', -19.1000, 146.8500),
(5, 7, 'Pink River Dolphin', 4, '2025-06-20', -3.5000, -58.4000),
(5, 5, 'Poison Dart Frog', 30, '2025-07-01', -3.4000, -58.3000),
(5, 6, 'Toucan', 8, '2025-07-15', -3.4200, -58.3500),
(6, 8, 'Guillemot', 500, '2025-07-15', 70.4600, -22.1100),
(6, 7, 'Kittiwake', 300, '2025-07-16', 70.4700, -22.1200),
(7, 9, 'Fennec Fox', 2, '2024-09-10', 25.0000, -5.0000),
(7, 5, 'Scorpion', 15, '2024-09-12', 25.1000, -5.1000),
(8, 10, 'Condor', 3, '2025-01-20', -15.0000, -70.0000),
(8, 3, 'Llama', 20, '2025-01-22', -15.1000, -70.1000),
(9, 4, 'Orangutan', 5, '2024-11-01', 2.5000, 115.0000),
(9, 6, 'Rafflesia Flower', 1, '2024-11-15', 2.4500, 115.1000),
(10, 5, 'Bald Eagle', 2, '2025-05-10', 43.0000, -79.0000),
(11, 12, 'Giant Tortoise', 10, '2025-08-15', -0.5000, -90.0000),
(11, 1, 'Hammerhead Shark', 4, '2025-08-20', -0.6000, -90.1000),
(12, 11, 'Kangaroo Paw (plant)', 50, '2024-07-10', -25.0000, 120.0000),
(12, 13, 'Emu', 6, '2024-07-12', -25.1000, 120.1000),
(14, 14, 'Lion', 8, '2025-09-20', -2.5000, 34.0000),
(14, 7, 'Giraffe', 15, '2025-09-21', -2.6000, 34.1000);

-- 1. vědec s největším počtem záznamů zvířat
select scientist.name from sighting inner join scientist on scientist_id = scientist.id 
group by scientist_id
order by sum(count) desc;

-- 2. zvire v oblasti antartic
select animal_type from sighting inner join expedition on expedition_id = expedition.id 
where expedition.region = 'Antarctic'
order by count desc;

-- 3. marine biology vedci a pozorovali velrybu
select scientist.name from sighting inner join scientist on scientist_id = scientist.id
where scientist.speciality = 'Marine biology' and scientist.id = (select scientist_id from sighting where animal_type = 'Whale');

-- 4. expedice delsi 60 dni
select name, datediff(end_date, start_date) from expedition where datediff(end_date, start_date) > 60;

-- 5. vedec na nejvice expedicich
select scientist.name, sum(team_lead_id) from expedition inner join scientist on team_lead_id = scientist.id 
order by sum(team_lead_id) desc;

-- 6. prumerny pocet pozorovani podle regionu
select sum(expedition_id) from sighting inner join expedition on expedition_id = expedition.id
group by expedition.region;

-- 7. Expedice bez pozorovani
select name from expedition inner join sighting on expedition.id = sighting.expedition_id
group by expedition.id, name
order by sum(sighting.count) desc;


-- 8. vedci podle narodnosti s vysokou aktivitou od nejvyssi
select scientist.name from scientist inner join expedition on scientist.id = expedition.team_lead_id
group by nationality
order by sum(expedition.team_lead_id) desc;

-- 9. Vypočítejte, kolik z celkového počtu pozorovaných zvířat (sloupec count) bylo zaznamenáno na severní polokouli (kladná zeměpisná šířka, location_lat > 0) a kolik na jižní polokouli (záporná zeměpisná šířka, location_lat < 0).
-- s chatem
select sum(case when location_lat > 0 then count else 0 end) as "Severni polokoule",
sum(case when location_lat < 0 then count else 0 end) as "Jizni polokoule"
from sighting;

-- 10. Jaká expedice drží rekord za nejsevernější pozorování zvířete a která za nejjižnější pozorování? 
select expedition.name, animal_type, max(location_lat) from sighting inner join expedition on expedition_id = expedition.id;

select expedition.name, animal_type, min(location_lat) from sighting inner join expedition on expedition_id = expedition.id;

