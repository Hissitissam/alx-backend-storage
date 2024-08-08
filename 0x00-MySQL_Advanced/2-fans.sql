--ranks country origins of bands, ordered by the number of (non-unique) fans.
WITH CountryFanCounts AS (
    SELECT
        origin,
        SUM(nb_fans) AS total_fans
    FROM
        metal_bands
    GROUP BY
        origin
)

SELECT
    origin,
    total_fans,
    RANK() OVER (ORDER BY total_fans DESC) AS rank
FROM
    CountryFanCounts
ORDER BY
    total_fans DESC;
