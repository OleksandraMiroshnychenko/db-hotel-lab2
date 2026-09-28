-- Кількість вільних номерів і вільних місць
WITH occupancy AS (
  SELECT
    r.room_id,
    rt.capacity,
    COUNT(s.stay_id) AS occupied
  FROM rooms r
  JOIN room_types rt
    ON rt.room_type_id = r.room_type_id
  LEFT JOIN stays s
    ON s.room_id = r.room_id
    AND s.checkout_date IS NULL
  GROUP BY r.room_id, rt.capacity
)
SELECT
  COUNT(*) FILTER (WHERE occupied = 0) AS free_rooms,
  COALESCE(SUM(capacity - occupied), 0) AS free_places
FROM occupancy;

