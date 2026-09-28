-- Клієнти, які проживають у номері з номером кімнати 101
SELECT
    c.last_name,
    c.first_name,
    c.patronymic,
    s.checkin_date
FROM stays s
JOIN clients c ON c.client_id = s.client_id
JOIN rooms r ON r.room_id = s.room_id
WHERE r.room_number = 101
  AND s.checkout_date IS NULL;