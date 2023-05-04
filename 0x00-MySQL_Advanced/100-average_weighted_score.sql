-- Script compute weighted average to score
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    user_id INT
)
BEGIN
    DECLARE av_w_scrore FLOAT(4,2);
    SET av_w_scrore = (SELECT SUM(score * weight) / SUM(weight)
                        FROM users AS U
                        JOIN corrections as C ON U.id=C.user_id
                        JOIN projects AS P ON C.project_id=P.id
                        WHERE id=user_id);
    UPDATE users SET average_score = av_w_scrore WHERE id=user_id;
END
//
DELIMITER ;
