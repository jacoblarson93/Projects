(defrule rule1
  ?p <- (start)
  =>
  (printout t "Input behaviour score located in parentheses next to selected behaviour: " crlf)
  (printout t "   Arguing(4), Bad Manners(1), Disrespectful(4)
			   Borrowing Without Asking(2), Clowning(3), Complaints(2)
			   Crying(0), Hitting(5), Hyperactivity(0)
			   Indifference(2), Insulting(4), Interrupting(2)
			   Lying(4), Making Threats(5), Negative Attitude(4)
			   Not Completing Work(4), Not Following Directions(3), Outbursts of Anger(5)
			   Passing Notes(1), Playing Pranks(2), Shouting Out(3)
			   Sleeping(0), Stealing(5), Swearing(4)
			   Talking Back(1), Talking w/o Permission(1), Teasing(1)
			   Temper Tantrums(5), Throwing Things(5), Violence(5)
			   Wandering out of Seat(3)
			   ")
  (assert (behaviour (read)))
  (assert (behaviour passed)) 
  (retract ?p))

(defrule rule2
  (behaviour passed)
  ?p <- (behaviour passed)
  =>
  (printout t "Input number of infractions in the last 72 hours: "crlf)
  (printout t "   ")
  (assert (consistency (read)))
  (assert (consistency passed))
  (retract ?p))
  
 (defrule rule3
   (consistency passed)
   ?p <- (consistency passed)
   =>
   (printout t "Enter autism calibrated severity score (0-10)" crlf)
   (printout t "   ")
   (assert (severity (read)))
   
   (retract ?p))
   
(defrule p1
  (behaviour neutral)
  (consistency rarely)
  (severity none)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule p2
  (behaviour neutral)
  (consistency frequently)
  (severity none)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule p3
  (behaviour neutral)
  (consistency regular)
  (severity none)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule p4
  (behaviour bad)
  (consistency rarely)
  (severity none)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule p5
  (behaviour bad)
  (consistency frequently)
  (severity none)
  =>
  (assert (action no recess))
  (printout t "Action: no recess"))
  
(defrule p6
  (behaviour bad)
  (consistency regular)
  (severity none)
  =>
  (assert (action move-desk))
  (printout t "Action: move desk"))
  
(defrule p7
  (behaviour very-bad)
  (consistency rarely)
  (severity none)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule p8
  (behaviour very-bad)
  (consistency frequently)
  (severity none)
  =>
  (assert (action move-desk))
  (printout t "Action: move-desk"))
  
(defrule p9
  (behaviour very_bad)
  (consistency regular)
  (severity none)
  =>
  (assert (action call-home))
  (printout t "Action: call home"))
  
(defrule d1
  (behaviour neutral)
  (consistency rarely)
  (severity mild)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule d2
  (behaviour neutral)
  (consistency frequently)
  (severity mild)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule d3
  (behaviour neutral)
  (consistency regular)
  (severity mild)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule d4
  (behaviour bad)
  (consistency rarely)
  (severity mild)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule d5
  (behaviour bad)
  (consistency frequently)
  (severity mild)
  =>
  (assert (action no recess))
  (printout t "Action: no recess"))
  
(defrule d6
  (behaviour bad)
  (consistency regular)
  (severity mild)
  =>
  (assert (action move-desk))
  (printout t "Action: move desk"))
  
(defrule d7
  (behaviour very-bad)
  (consistency rarely)
  (severity mild)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule d8
  (behaviour very-bad)
  (consistency frequently)
  (severity mild)
  =>
  (assert (action move-desk))
  (printout t "Action: move-desk"))
  
(defrule d9
  (behaviour very_bad)
  (consistency regular)
  (severity mild)
  =>
  (assert (action call-home))
  (printout t "Action: call home")) 

(defrule c1
  (behaviour neutral)
  (consistency rarely)
  (severity moderate)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule c2
  (behaviour neutral)
  (consistency frequently)
  (severity moderate)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule c3
  (behaviour neutral)
  (consistency regular)
  (severity moderate)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule c4
  (behaviour bad)
  (consistency rarely)
  (severity moderate)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule c5
  (behaviour bad)
  (consistency frequently)
  (severity moderate)
  =>
  (assert (action timeout)
  (printout t "Action: timeout"))
  
(defrule c6
  (behaviour bad)
  (consistency regular)
  (severity moderate)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule c7
  (behaviour very-bad)
  (consistency rarely)
  (severity moderate)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule c8
  (behaviour very-bad)
  (consistency frequently)
  (severity moderate)
  =>
  (assert (action move-desk))
  (printout t "Action: move-desk"))
  
(defrule c9
  (behaviour very_bad)
  (consistency regular)
  (severity moderate)
  =>
  (assert (action call-home))
  (printout t "Action: call home")) 

(defrule k1
  (behaviour neutral)
  (consistency rarely)
  (severity severe)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule k2
  (behaviour neutral)
  (consistency frequently)
  (severity severe)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule k3
  (behaviour neutral)
  (consistency regular)
  (severity sever)
  =>
  (assert (action timeout))
  (printout t "Action: timeout"))
  
(defrule k4
  (behaviour bad)
  (consistency rarely)
  (severity severe)
  =>
  (assert (action warning))
  (printout t "Action: warning"))
  
(defrule k5
  (behaviour bad)
  (consistency frequently)
  (severity severe)
  =>
  (assert (action timeout)
  (printout t "Action: timeout"))
  
(defrule k6
  (behaviour bad)
  (consistency regular)
  (severity severe)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule k7
  (behaviour very-bad)
  (consistency rarely)
  (severity severe)
  =>
  (assert (action no-recess))
  (printout t "Action: no recess"))
  
(defrule k8
  (behaviour very-bad)
  (consistency frequently)
  (severity severe)
  =>
  (assert (action move-desk))
  (printout t "Action: move-desk"))
  
(defrule k9
  (behaviour very_bad)
  (consistency regular)
  (severity severe)
  =>
  (assert (action call-home))
  (printout t "Action: call home"))  
  
(deffacts startup
  (start))