-- Кількість вільних номерів і вільних місць (загальна місткість вільних номерів)
SELECT
    COUNT(*) AS free_rooms,
    COALESCE(SUM(rt.capacity), 0) AS free_places
FROM rooms r
JOIN room_types rt ON rt.room_type_id = r.room_type_id
WHERE r.room_id NOT IN (
    SELECT room_id FROM stays WHERE checkout_date IS NULL
);