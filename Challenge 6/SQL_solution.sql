WITH ranked_events AS (
    SELECT
        event_id,
        user_id,
        timestamp,
        event_type,
        page_url,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) AS event_rank
    FROM web_events
)

SELECT DISTINCT e1.user_id, e1.timestamp AS homepage_view_time, 
                e2.timestamp AS product_view_time, e3.timestamp AS add_to_cart_time
FROM ranked_events e1
JOIN ranked_events e2 ON e1.user_id = e2.user_id AND e1.event_rank + 1 = e2.event_rank
JOIN ranked_events e3 ON e1.user_id = e3.user_id AND e1.event_rank + 2 = e3.event_rank
WHERE e1.event_type = 'page_view' AND e1.page_url = '/homepage'
  AND e2.event_type = 'page_view' AND e2.page_url LIKE '/product/%'
  AND e3.event_type = 'add_to_cart';