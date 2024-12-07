/*
1)	Create a view called ‘mccGrounds_south’ that lists all the details of any grounds in Durham or Sunderland.
2)	Output all the data in the ‘mccGrounds_south’ view.
3)	Output just the ground name and postcode from the ‘mccGrounds_south’ view.
4)	Output just the ground name and postcode of grounds in Sunderland from the ‘mccGrounds_south’ view.
5)	Add a new ground to the ‘mccGrounds_south’ view, with the attributes:
Ground name = Lords, Street = St Johns Wood Road, Town = London, Postcode = NW1 2AD
6)	Check to see how the ‘mccGrounds_south’ view and underlying base table have changed.
7)	Modify the ‘mccGrounds_south’ view so that it includes London grounds, and check how the view output has changed.
8)	Modify the ‘mccGrounds_south’ view to include the clause WITH CHECK OPTION at the end of the statement (just before the ;). Try to add a new ground to the ‘mccGrounds_south’ view, with the attributes:
Ground name = Victoria Park, Street = Thames Road, Town = Slough, Postcode = SL7 4BY
Why does this insert fail?
9)	Create a view called ‘mccCenturians’ that outputs the names and highest batting score of all players who have scored 100 or more in a match. Check the output from the view.
*/
use cricket_club;
CREATE VIEW mccGrounds_south AS  select * from mccground where g_town in ("Sunderland", "Durham");

select * from mccgrounds_south;

select ground_name,g_postcode from mccgrounds_south;

select ground_name,g_postcode from mccgrounds_south where g_town="Sunderland";

INSERT INTO mccground VALUES ('Lords', 'St Johns Wood Road', 'London', 'NW1 2AD');

CREATE OR REPLACE VIEW mccgrounds_south as select * from mccground where g_town in ("Sunderland", "Durham", "London");

 CREATE OR REPLACE VIEW mccgrounds_south as select * from mccground where g_town in ("Sunderland", "Durham", "London")  WITH CHECK OPTION;
 INSERT INTO mccgrounds_south values ("Victoria Park", "Thames Road", " Slough"," SL7 4BY");
 -- Fails as the condition in the where statement must be met
 

 
 CREATE VIEW mccCenturians as SELECT DISTINCT mccmatch_performance.registration_number, name, batting_score from mccmatch_performance 
 JOIN mccplayer on mccplayer.registration_number=mccmatch_performance.registration_number where batting_score>=100;
 
 

