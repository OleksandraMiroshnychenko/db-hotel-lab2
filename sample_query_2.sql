-- Клієнти, які прибули з Харкова
SELECT
    last_name,
    first_name,
    patronymic,
    city
FROM clients
WHERE city = 'Харків';