-- script that creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUserBatch;
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUserBatch(
    IN user_ids VARCHAR(255))
BEGIN
    DECLARE avg_score FLOAT;
    SET @query = CONCAT('UPDATE users U, (SELECT user_id, AVG(score) as avg_score FROM corrections WHERE user_id IN (', user_ids, ') GROUP BY user_id) C SET U.average_score = C.avg_score WHERE U.id=C.user_id');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END
$$
DELIMITER ;
