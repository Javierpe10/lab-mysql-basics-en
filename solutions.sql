USE bank;
/*Query 1*/
/*Get first 5 ID from clients where district_id = 1*/
SELECT client_id
FROM client
WHERE district_id = 1
LIMIT 5;

/*Query2*/
/*From client get id value of the last client where district_id = 72*/
SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC
LIMIT 1;

/*Query3*/
/*Get 3 lowest amounts in loan table*/
SELECT amount
FROM loan
ORDER BY amount ASC
LIMIT 3;

/*Query4*/
/*Possible values for status, order alphabet in ascending order in loan*/
SELECT DISTINCT status 
FROM loan
ORDER BY status ASC;

/*Query5*/
/*loan_id of highest payment in loan*/
SELECT loan_id
FROM loan
ORDER BY payments DESC
LIMIT 1;

/*Query6*/
/*loan amount of lowest 5 accounts_id in loan table
Show account_id and amount*/
SELECT account_id, amount
FROM loan
ORDER BY account_id ASC
LIMIT 5;

/*Query7*/
/*account_id with lowest loan amount that have loan duration of 60 in loan table*/
SELECT account_id
FROM loan
WHERE duration = 60
ORDER BY amount ASC
LIMIT 5;

/*Query8*/
/*unique values of k_symbol in order table*/
SELECT DISTINCT k_symbol
FROM bank.order
ORDER BY k_symbol ASC;

/*Query9*/
/*order_id with account_id = 34 from order table*/
SELECT order_id
FROM bank.order
WHERE account_id = 34;

/*Query10*/
/*In order table wich account_id responsible for orders
between order_id 29549 and 29560*/
SELECT DISTINCT account_id
FROM bank.order
WHERE order_id >=29540 and order_id <= 29560;

/*Query11*/
/*In the `order` table, what are the individual amounts that 
account_to id 30067122*/
SELECT amount
FROM bank.order
where account_to = 30067122;

/*Query12*/
/*Show trans_id. date, type and amount of 10 first transactions
from account_id 793 in chronological order from new to old*/
SELECT trans_id, date, type, amount
FROM trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

/*Query13*/
/*from client table, of all district_id lower than 10,
how many clients are from each district_id?, show district_id in ascending order*/
SELECT district_id, COUNT(*) AS total_clients /*Impossible to solve without count*/
FROM client
WHERE district_id < 10
GROUP BY district_id /*not other way to solve the question*/
ORDER BY district_id ASC;

/*Query14*/
/*From card table, how many cards for each type. from most frequent type*/
SELECT DISTINCT type, COUNT(*) as total_cards
FROM card
GROUP BY type
ORDER BY total_cards DESC;

/*Query15*/
/*From loan table, print top 10 account_id based on the SUM 
of their loan amounts*/
SELECT account_id, SUM(amount) AS total_amount
FROM loan
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 10;

/*Query16*/
/*From loan table, retrieve number of loans issued for each day
before 930907, order by date in descending order*/
SELECT date, COUNT(loan_id) AS number_of_loans
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

/*Query17*/
/*From loan table for each day in December 1997, count the numbers
of loans issued for each unique loan duration, order by date and duration
in ascending order*/
SELECT DISTINCT date, duration, COUNT(loan_id) as number_of_loan
FROM loan
WHERE date >= 971201 AND date <= 971231
GROUP BY date, duration
ORDER BY date, duration ASC;

/*Query18*/
/*From trans, for account:id 396, sum amount of transaction for each type.
Output account_id, type, total _amount. Sort alphabet*/
SELECT DISTINCT account_id, type, SUM(amount) AS total_amount
from trans
WHERE account_id = 396
GROUP BY account_id, type
ORDER BY account_id, type ASC;




