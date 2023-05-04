-- Script creates  view need meeting
DROP VIEW IF EXISTS need_meeting;
CREATE VIEW need_meeting AS
SELECT name FROM students
WHERE
    score < 80 AND
    (last_meeting < ADDDATE(CURDATE(), interval -1 MONTH)
        OR
    last_meeting IS NULL
    );
