create database project;
use project;

DROP TABLE IF EXISTS job_data;

CREATE TABLE job_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL,
    actor_id INT,
    event VARCHAR(40),
    language VARCHAR(40),
    time_spent INT,
    org VARCHAR(70),
    ds DATE
);

INSERT INTO job_data (ds, job_id, actor_id, event, language, time_spent, org)  
VALUES 
('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),
('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),
('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),
('2020-11-28', 23, 1005, 'transfer', 'Persian', 22, 'D'),
('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),
('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),
('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),
('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C');

select * from job_data;

