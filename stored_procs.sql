------------------------ STORED PROCEDURE --------------------------

#Searches titles using allScores view and returns titles and scores that contain a certain phrase or word

DELIMITER $$

DROP PROCEDURE IF EXISTS search_by_keyword$$

CREATE PROCEDURE search_by_keyword(IN in_keyword VARCHAR(255)
BEGIN
	SET @keyword = in_keyword;

	PREPARE title_select_statement FROM
	'SELECT title, sentiment_score, magnitude
	FROM all_Scores
	WHERE title LIKE CONCAT("%", ?, "%")';

	EXECUTE title_select_statement USING @keyword;

	DEALLOCATE PREPARE title_select_statement;

END$$

DELIMITER ;

CALL search_by_keyword('dog');
