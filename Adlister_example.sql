SELECT email_address
FROM ad
WHERE user = user_name;

SELECT category
FROM ad
GROUP BY category;

SELECT ad
FROM category
GROUP BY ad;