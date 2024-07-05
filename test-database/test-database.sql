// 1. Tampilkan daftar siswa beserta kelas dan guru yang mengajar kelas tersebut.
SELECT s.name AS student_name, c.name AS class_name, t.name AS teacher_name
FROM students s
JOIN classes c ON s.class_id = c.id
JOIN teachers t ON c.teacher_id = t.id;

// 2. Tampilkan daftar kelas yang diajar oleh guru yang sama.
SELECT c.name AS class_name, t.name AS teacher_name
FROM classes c
JOIN teachers t ON c.teacher_id = t.id
ORDER BY teacher_name;

// 3. Buat query view untuk siswa, kelas, dan guru yang mengajar
CREATE VIEW student_class_teacher AS
SELECT s.name AS student_name, c.name AS class_name, t.name AS teacher_name
FROM students s
JOIN classes c ON s.class_id = c.id
JOIN teachers t ON c.teacher_id = t.id;

// 4. Buat query yang sama tapi menggunakan stored procedure
DELIMITER //

CREATE PROCEDURE GetStudentClassTeacher()
BEGIN
    SELECT s.name AS student_name, c.name AS class_name, t.name AS teacher_name
    FROM students s
    JOIN classes c ON s.class_id = c.id
    JOIN teachers t ON c.teacher_id = t.id;
END //

DELIMITER ;

// 5. Buat query input, yang akan memberikan warning error jika ada data yang sama pernah masuk
INSERT INTO teachers (name, subject) VALUES ('Pak Anton', 'Matematika');
INSERT INTO teachers (name, subject) VALUES ('Bu Dina', 'Bahasa Indonesia');
INSERT INTO teachers (name, subject) VALUES ('Pak Eko', 'Biologi');

-- insert duplicate data
INSERT INTO teachers (name, subject) VALUES ('Pak Anton', 'Matematika');
