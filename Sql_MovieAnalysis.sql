use data_analysis_movies

SELECT COUNT(*) 
FROM members 
WHERE  member_state = 'Texas';

SELECT movie_id, movie_name 
FROM movies
WHERE movie_genre like '%|%|%|%'


SELECT movie_genre, COUNT(*) 
FROM movies 
GROUP BY movie_genre;

SELECT movie_id, COUNT(rating_id) AS rating_count 
FROM ratings 
GROUP BY movie_id 
ORDER BY rating_count DESC 

SELECT 
  (COUNT(DISTINCT member_id) / (SELECT COUNT(*) FROM members)) * 100 AS percentage_rated_members
FROM ratings;

SELECT gender, COUNT(rating_id) AS rating_count
FROM members
JOIN ratings ON members.member_id = ratings.member_id
GROUP BY gender
ORDER BY rating_count DESC
LIMIT 1;


SELECT COUNT(*) 
FROM members 
WHERE state = 'New York' 
AND gender = 'preferred_gender';


SELECT movie_id, movie_name, COUNT(rating_id) AS rating_count
FROM movies
JOIN ratings ON movies.movie_id = ratings.movie_id
WHERE movie_genre LIKE '%Sci-Fi%'
GROUP BY movie_id
ORDER BY rating_count DESC


SELECT gender, COUNT(*) AS sci_fi_count
FROM members
JOIN ratings ON members.member_id = ratings.member_id
JOIN movies ON ratings.movie_id = movies.movie_id
WHERE movie_genre LIKE '%Sci-Fi%'
GROUP BY gender
ORDER BY sci_fi_count DESC



SELECT DISTINCT members.member_id
FROM members
JOIN ratings ON members.member_id = ratings.member_id
WHERE ratings.movie_id IN (SELECT movie_id FROM ratings WHERE member_id = 106);

