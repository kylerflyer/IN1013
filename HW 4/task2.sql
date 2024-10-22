USE pet_database;


INSERT INTO petevent
VALUES ('Fluffy', '2020-10-15', 'vet','antobiotics');

INSERT INTO petpet 
VALUES ('Hammy', 'Diane', 'hamster', 'm','2010-10-30',null);

INSERT INTO petevent
VALUES ('Hammy', '2020-10-15', 'vet','antobiotics');


INSERT INTO petevent
VALUES ('Claws','1997-08-03', 'vet', 'Broken ribs');

UPDATE petpet set death='2020-09-01' where petname="Puffball";

DELETE FROM petpet where owner="Harold";