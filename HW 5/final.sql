CREATE TABLE airport (
  icao   int(5) NOT NULL, 
  `size` char(1) NOT NULL, 
  PRIMARY KEY (icao));
CREATE TABLE Airway (
  airwayIdent     varchar(10) NOT NULL, 
  type            char(1), 
  minimumAltitude int(10), 
  maxAltitude     int(10), 
  CONSTRAINT airwayIdent 
    PRIMARY KEY (airwayIdent));
CREATE TABLE airway_route (
  airwayIdent varchar(10) NOT NULL, s
  pointId     int(5) NOT NULL, 
  orderNumber int(10) NOT NULL, 
  first       varchar(10) NOT NULL, 
  last        varchar(255) NOT NULL, 
  PRIMARY KEY (airwayIdent, 
  pointId));
CREATE TABLE Boundary2 (
  id       int(11) NOT NULL AUTO_INCREMENT, 
  type     char(2) NOT NULL, 
  name     varchar(50), 
  min      int(10), 
  max      int(11), 
  geometry text NOT NULL, 
  CONSTRAINT id 
    PRIMARY KEY (id));
CREATE TABLE navaid (
  pointId   int(5) NOT NULL, 
  frequency float NOT NULL, 
  elevation int(5) NOT NULL, 
  PRIMARY KEY (pointId));
CREATE TABLE point (
  pointId   int(5) NOT NULL AUTO_INCREMENT, 
  ident     varchar(30) NOT NULL, 
  longitude float NOT NULL, 
  latitude  float NOT NULL, 
  name      varchar(30) NOT NULL, 
  PRIMARY KEY (pointId));
CREATE TABLE sidStar (
  chartName varchar(30) NOT NULL, 
  icao      int(5) NOT NULL, 
  type      varchar(10) NOT NULL, 
  dateAdded date NOT NULL, 
  PRIMARY KEY (chartName));
CREATE TABLE sidStar_routing (
  chartName              varchar(30) NOT NULL, 
  pointId                int(5) NOT NULL, 
  nextSegment_chartName  varchar(30), 
  nextSegment_waypointId int(5), 
  altitudeContraint      int(10), 
  CONSTRAINT navaidId 
    PRIMARY KEY (chartName, 
  pointId));
CREATE TABLE waypoint (
  pointId int(5) NOT NULL, 
  type    varchar(10) NOT NULL, 
  region  char(2) NOT NULL, 
  CONSTRAINT `ident,tyoe` 
    PRIMARY KEY (pointId));
ALTER TABLE sidStar_routing ADD CONSTRAINT FKsidStar_ro613830 FOREIGN KEY (nextSegment_chartName, nextSegment_waypointId) REFERENCES sidStar_routing (chartName, pointId);
ALTER TABLE airway_route ADD CONSTRAINT FKairway_rou179890 FOREIGN KEY (pointId) REFERENCES waypoint (pointId);
ALTER TABLE sidStar_routing ADD CONSTRAINT FKsidStar_ro916048 FOREIGN KEY (pointId) REFERENCES waypoint (pointId);
ALTER TABLE navaid ADD CONSTRAINT FKnavaid265073 FOREIGN KEY (pointId) REFERENCES waypoint (pointId);
ALTER TABLE sidStar_routing ADD CONSTRAINT FKsidStar_ro279417 FOREIGN KEY (chartName) REFERENCES sidStar (chartName);
ALTER TABLE airport ADD CONSTRAINT FKairport202900 FOREIGN KEY (icao) REFERENCES point (pointId);
ALTER TABLE waypoint ADD CONSTRAINT FKwaypoint148909 FOREIGN KEY (pointId) REFERENCES point (pointId);
ALTER TABLE sidStar ADD CONSTRAINT FKsidStar495142 FOREIGN KEY (icao) REFERENCES airport (icao);
ALTER TABLE airway_route ADD CONSTRAINT FKairway_rou869975 FOREIGN KEY (airwayIdent) REFERENCES Airway (airwayIdent);
