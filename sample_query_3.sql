-- Хто прибирав номер клієнта з паспортом 'ЕК456789' у середу (3)
SELECT DISTINCT
    e.last_name,
    e.first_name,
    e.patronymic,
    cs.floor,
    cs.weekday
FROM clients cl
JOIN stays s ON s.client_id = cl.client_id
JOIN rooms r ON r.room_id = s.room_id
JOIN cleaning_schedule cs ON cs.floor = r.floor
JOIN employees e ON e.employee_id = cs.employee_id
WHERE cl.passport_number = 'ЕК456789'
  AND cs.weekday = 3
  AND s.checkout_date IS NULL;