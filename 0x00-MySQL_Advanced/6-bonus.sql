-- stored procedure AddBonus that adds a new correction for a student.
CREATE PROCEDURE AddBonus
    (
      @user_id INT,
      @project_name VARCHAR(50),
      @score INT
    )
AS
BEGIN
    -- Check if the project already exists in the table
    IF NOT EXISTS (SELECT * FROM projects WHERE name = @project_name)
    BEGIN
      -- If it doesn't, insert a new project row
      INSERT INTO projects (name) VALUES (@project_name)
    END

    INSERT INTO corrections (user_id, project_id, score) 
    VALUES (@user_id, (SELECT id FROM projects WHERE name = @project_name), @score)
END

