-- Script creates  view need meeting
CREATE VIEW need_meeting AS
SELECT s.name
FROM students s
LEFT JOIN meetings m ON s.id = m.student_id AND m.meeting_date >= ADDDATE(CURDATE(), interval -1 MONTH)
WHERE s.score < 80 AND m.id IS NULL;
