/*
Program Name : balance.p
Purpose      : To display total balance of the customer
*/

define variable totbalance as decimal no-undo.
define variable l_cust_from like customer.custnum no-undo.
define variable l_cust_to   like customer.custnum no-undo.
form    
    l_cust_from To 25
    l_cust_to   to 50 label "To"
    with frame a side-labels width 80.
    form
       customer.custnum at 01
       customer.name    at 15
       balance at 50

    with frame b width 132 down.
repeat :
            update l_cust_from l_cust_to with frame a.
            hide frame a.
			totbalance = 0.
			for each customer no-lock
            where custnum ge l_cust_from and custnum le l_cust_to :
            disp custnum name balance (total)
            with frame b.
            down 1 with frame b.
            totbalance = totbalance + balance.
            end.
                    message "Total Balance " totbalance .
                    end.
