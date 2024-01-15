use top_1000_youtubers;

select * from youtubers_df;

-- 1.Overall view of dataset
SELECT
COUNT(DISTINCT Country) as Total_Country,
COUNT(DISTINCT Categories) as Total_Categories,
ROUND(AVG(Suscribers),2) as Average_Subscribers,
ROUND(AVG(Likes),2) as Avg_Likes,
ROUND(AVG(Visits),2) as Avg_Visits,
ROUND(AVG(Comments),2) as Avg_Comments
FROM youtubers_df;


-- 2. top Channels category-wise
SELECT Categories, COUNT(Username) as Total_Channel
FROM youtubers_df
GROUP BY Categories
ORDER BY Total_Channel desc;


-- 3. top Channels Country-wise
SELECT Country , COUNT(Username) as Total_Channel
FROM youtubers_df
GROUP BY Country
ORDER BY Total_Channel desc;

-- 4. Top 10 User Engagement
SELECT Username, 
ROUND(AVG(Suscribers),2) as Avg_Subscribers, 
ROUND(AVG(Likes),2) as Avg_Likes, 
ROUND(AVG(Comments),2) as Avg_Comments, 
ROUND(AVG(Visits),2) as Avg_Visits
FROM youtubers_df
group BY Username
ORDER BY Avg_Subscribers DESC
LIMIT 10;


-- 5. Top Performance Identification
SELECT Username, Suscribers, Country
from youtubers_df
ORDER BY Suscribers DESC
LIMIT 10;

-- 6. Categories with Higher Engagement Rate [Content and Channel recommendation]
SELECT Categories, 
ROUND(AVG(Suscribers),2) as Average_Subscribers,
ROUND(AVG(Likes),2) as Avg_Likes, 
ROUND(AVG(Comments),2) as Avg_Comments, 
ROUND(AVG(Visits),2) as Avg_Visits
FROM youtubers_df
GROUP BY Categories
ORDER BY Average_Subscribers DESC;

-- 7. Subscribers Engagement Across Globe
SELECT Country,
ROUND(AVG(Suscribers),2) as Average_Subscribers,
ROUND(AVG(Likes),2) as Avg_Likes, 
ROUND(AVG(Comments),2) as Avg_Comments, 
ROUND(AVG(Visits),2) as Avg_Visits
FROM youtubers_df
GROUP BY Country
ORDER BY Average_Subscribers DESC
LIMIT 10;