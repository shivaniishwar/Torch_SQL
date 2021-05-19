# Torch SQL Assessment

This assessment was completed on May 19th, 2021 using data from the [U.S. Department of Health and Human Services](https://beta.healthdata.gov/api/views/j8mb-icvb/rows.csv?accessType=DOWNLOAD). The queries are written in PostgreSQL.

## Query 1
**Assignment:** Find the total number of PCR tests performed as of yesterday in the United States.  

The query for this question is labeled "QUERY 1" in [SQL_queries.sql](SQL_queries.sql). The results of this query are displayed [here](result_tables/query1_table.csv).  

**Documentation:** At the time of completing this assessment (May 19th, 2021), the dataset did not have data for a few days leading up to the current date. While the final query would yield the number of PCR tests "yesterday" (May 18th), the dataset I downloaded only has data up to the 16th. So the result found in [this table](result_tables/query1_table.csv) are based on a query for May 16th, yielding a total number of 310,539,440 PCR tests. It's worth noting that this data is still incomplete, featuring only 43 of the 55 locations in which PCR tests are administered. (A state- and territory-based breakdown of the data is available [here](result_tables/query1_addendum.csv), showing which states and territories are represented in the total number.) Therefore it can be assumed that less recent data is more complete and accurate, and a query for one week ago would probably yield a more comprehensive look at the PCR tests administered than one for yesterday.

## Query 2
**Assignment:** Find the 7-day rolling average number of new cases per day for the last 30 days.  

The query for this question is labeled "QUERY 2" in [SQL_queries.sql](SQL_queries.sql). The results of this query are displayed [here](result_tables/query2_table.csv).  

**Documentation:** This query yields a rolling average of new cases in the U.S., based on the "new_results_reported" field and the "overall_outcome" field (only positive test results were counted as new cases). Similarly, the incompleteness of data means that there is only data up to May 16th in the resulting table, but because the rolling average contains information from the entire week ending on the date in question, this number would typically be less affected by the incomplete data. There is generally a downward trend in this data, even before the last few days of incomplete data, which would suggest a general lessening in the number of cases countrywide (from about 64,000 cases to under 30,000 cases). It might be beneficial to see rolling averages of this nature for each individual state and territory, in order to determine any sub-trends contributing to this larger number.

## Query 3
**Assignment:** Find the 10 states with the highest test positivity rate (positive tests / tests performed) for tests performed in the last 30 days.  

The query for this question is labeled "QUERY 3" in [SQL_queries.sql](SQL_queries.sql). The results of this query are displayed [here](result_tables/query3_table.csv).  

**Documentation:** This query shows a list of the 10 states and territories with the highest positivity rate in the past month: Michigan, Puerto Rico, South Dakota, Nebraska, Florida, West Virginia, Alabama, Pennsylvania, Tennessee, and Oklahoma. These numbers range from roughly 5 to 9% positivity, which is quite a high number. This is also based on a degree of incomplete data, especially considering that some territories did not have data for May 15th and 16th as of performing this calculation. However, this does give an overall idea of where the virus is most concentrated in the U.S., and might help to inform policy and public health decisions in those areas.
