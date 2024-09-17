-- Many-to-Many example
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;


PRAGMA foreign_keys = ON;

CREATE TABLE students (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(50)
);

CREATE TABLE courses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_name VARCHAR(50)
);

CREATE TABLE student_course (
  student_id INTEGER,
  course_id INTEGER,
  FOREIGN KEY (student_id) REFERENCES students(id),
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

INSERT INTO students (name) VALUES ('Alice'), ('Bob');
INSERT INTO courses (course_name) VALUES ('Math'), ('Science');
INSERT INTO student_course (student_id, course_id) VALUES (1, 1), (1, 2), (2, 1);

--  list of students and the courses they are enrolled in
SELECT students.name, courses.course_name FROM student_course
JOIN students ON student_course.student_id = students.id
JOIN courses ON student_course.course_id = courses.id;

-- SELECT * FROM students;
