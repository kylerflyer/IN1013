
USE pet_database;



CREATE TABLE petPet (
  petname varchar(20),
  owner varchar(45),
  species varchar(45) ,
  gender ENUM('m','f'),
  birth date,
  death date,
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
  petname varchar(20) NOT NULL,
  eventdate date,
  eventtype varchar(15),
  remark varchar(255),
  PRIMARY KEY (petname,eventdate,eventype),
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE
);