define variable l_tot_amount as decimal format ">>>>>>>>>9.99" no-undo.
define variable l_tot_totalpaid as decimal format ">>>>>>>>>>9.99" no-undo.
def var from_cust like order.custnum  no-undo.
def var to_cust like order.custnum  no-undo.
form
    from_cust  colon 20 label "cust"
    to_cust     colon 60 label "to"
with frame a width 80 side-labels.



form
  customer.custnum    at 01 format ">>>>9"
  customer.name       at 09 format ">>>>9"
  order.ordernum         at 16 format "99999"
  order.orderdate             at 24 format "99/99/99"
  order.po          at 36 format "99999999.99"
  order.terms       at 42 format "99999999.99"
with frame c width 80 no-label down .



repeat:
    update from_cust to_cust with frame a.
    for each customer no-lock
    where custnum >= from_cust and custnum <= to_cust,
        each order no-lock
            where customer.custnum = order.custnum
            break by order.custnum :
            if first-of (order.custnum) then do:
            display customer.name.
                 end.
            display customer.custnum customer.name  order.ordernum
order.orderdate order.PO order.Terms 
with frame c.
            if last-of (order.custnum) then do:
               display customer.name.
               end.
            end.
end.