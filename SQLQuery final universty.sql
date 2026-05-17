-- استيراد البيانات
CREATE TABLE universities (
    university_name VARCHAR(100),
    faculty VARCHAR(100),
    department VARCHAR(100),
    city VARCHAR(50),
    stream VARCHAR(50),
    founded_year INT,
    min_score FLOAT,
    min_percentage FLOAT
);
-- أعلى 5 جامعات في علمي رياضة
SELECT university_name, city, min_score, min_percentage
FROM universities
WHERE stream = 'Science-Math'
ORDER BY min_score DESC
LIMIT 5;
-- متوسط المجموع لكل شعبة
SELECT stream, 
       AVG(min_score) AS avg_score,
       MAX(min_score) AS max_score,
       MIN(min_score) AS min_score
FROM universities
GROUP BY stream;
-- الجامعات اللي تقبل بمجموع معين
SELECT DISTINCT university_name, city, min_score
FROM universities
WHERE stream = 'Science-Math'
  AND min_score <= 350
ORDER BY min_score DESC;
-- عدد الكليات لكل جامعة
SELECT university_name, COUNT(DISTINCT faculty) AS faculty_count
FROM universities
GROUP BY university_name
ORDER BY faculty_count DESC;


