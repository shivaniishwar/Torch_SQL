-- QUERY 1

SELECT date, SUM(total_results_reported) AS total_tests
  FROM sishwar.pcrtest
  WHERE date > (NOW() - interval '2 days')
  GROUP BY date
  ORDER BY date;

-- QUERY 2

SELECT *
  FROM (SELECT date, new_cases, AVG(new_cases)
    OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_avg
  FROM (SELECT date, SUM(new_results_reported) AS new_cases
  FROM sishwar.pcrtest
  WHERE overall_outcome = 'Positive'
  GROUP BY date
  ORDER BY date) AS average) AS rolling_average
  WHERE date > (NOW() - interval '31 days');

-- QUERY 3

SELECT state_name, (positive_tests / total_tests) AS positive_rate
  FROM (SELECT state_name, SUM(new_results_reported) AS total_tests,
    SUM(CASE WHEN overall_outcome = 'Positive' THEN new_results_reported ELSE 0 END) AS positive_tests
    FROM sishwar.pcrtest
    WHERE date > (NOW() - interval '31 days')
    GROUP BY state_name) AS aggregate
    ORDER BY positive_rate DESC
    LIMIT 10;
