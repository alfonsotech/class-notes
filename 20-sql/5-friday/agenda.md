
## Taking Flex Day 
Please send message to the cohort's general channel, not a PM

## PA Walkthrough posted to cohort session-video-channel

## Aggregates

- aggregate functions allow developers to run basic mathematical calculations within a query.

    - COUNT - How many times does this entry occur
        - count(X) or count(*)
        - The count(X) function returns a count of the number  of times that X is not NULL in a group. The count(*) function (with no arguments) returns the total number of rows in the group.
    - MIN - The lowest value
    - MAX - The highest value
    - SUM or TOTAL - Adds up the values
    - AVG - The average of the values


## Subqueries

- Subquery statements are constructed in two steps:

    1. Write and test a SELECT statement for the field (usually    only one, like id) or fields needed for the subquery.
    2. Place the subquery in the WHERE clause of another SQL    tatement with parentheses around it.

    ```sql
        SELECT <fields>
        FROM <table>
        WHERE <field> <operator> (
        SELECT <field>
        FROM <table>
        )
    ```