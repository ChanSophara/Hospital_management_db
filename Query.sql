select * from appointments;

select * from doctors;

select * from location;

select * from medical_histories;

select * from patients;

select * from schedules;

select * from medical_histories
where date(date_time) = '2023-01-01';

SELECT * FROM medical_histories 
WHERE patient_id = 'P001';

select * from patients
where gender = 'Male';

SELECT * FROM appointments 
WHERE doctor_id = 'D001' AND date = '2023-06-01';

SELECT * FROM schedules 
WHERE availability = 'Available';

SELECT * FROM schedules 
WHERE locations_room_number = 'R001' AND availability = 'Available';

select * from patients 
where first_name like 'J%'
order by last_name ASC;

select * from schedules
where time_table = 'Afternoon'
order by doctors_doctor_id;

SELECT p.patient_id, p.first_name, p.last_name, mh.surgery 
FROM Patients p
JOIN medical_histories mh ON p.patient_id = mh.patient_id
WHERE mh.surgery = 'Appendectomy';

SELECT d.doctor_id, d.first_name, d.last_name, COUNT(a.appointment_id) AS appointment_count
FROM Doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY appointment_count DESC;

SELECT DISTINCT p.patient_id, p.first_name, p.last_name, mh.surgery
FROM Patients p
JOIN medical_histories mh ON p.patient_id = mh.patient_id
WHERE mh.surgery IS NOT NULL AND mh.surgery != ''
ORDER BY p.last_name, p.first_name;

SELECT s.schedule_id, s.start_time, s.end_time, s.day, d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
FROM schedules s
JOIN Doctors d ON s.doctors_doctor_id = d.doctor_id
WHERE s.locations_room_number = '101'
ORDER BY s.day, s.start_time;

