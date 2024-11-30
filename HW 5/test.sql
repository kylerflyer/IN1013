use avdatabase;


CREATE TABLE point (
    pointId VARCHAR(20) NOT NULL UNIQUE,
    longitude FLOAT(30) NOT NULL UNIQUE,
    latitude FLOAT(30) NOT NULL UNIQUE,
    name VARCHAR(30),
    PRIMARY KEY (pointId, longitude, latitude)
);


CREATE TABLE airport (
    icao VARCHAR(20) NOT NULL ,
    longitude float(30) NOT NULL ,
    latitude float(30) NOT NULL ,
    size CHAR(1),
    UNIQUE (Icao, longitude, latitude),
    FOREIGN KEY (icao, longitude, latitude) REFERENCES point(pointId, longitude, latitude),
    PRIMARY KEY (icao, longitude, latitude)
    
);

CREATE TABLE waypoint (
    pointId VARCHAR(20) NOT NULL,
    pointLongitude FLOAT(30) NOT NULL,
    pointLatitude FLOAT(30) NOT NULL,
    type VARCHAR(10) NOT NULL,
    ident VARCHAR(30),
    region CHAR(2),
    UNIQUE(pointId, pointLongitude, pointLatitude),
    FOREIGN KEY (pointId, pointLongitude, pointLatitude) REFERENCES point(pointId, longitude, latitude),
    PRIMARY KEY (pointId, pointLongitude, pointLatitude, type)
);

CREATE TABLE navaid (
    pointId VARCHAR(20) NOT NULL,
    pointLongitude FLOAT(30) NOT NULL,
    pointLatitude FLOAT(30) NOT NULL,
    type VARCHAR(10) NOT NULL,
    frequency FLOAT(6),
    elevation INT,
    UNIQUE(pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (pointId, pointLongitude, pointLatitude, type) REFERENCES waypoint(pointId, pointLongitude, pointLatitude, type),
	PRIMARY KEY (pointId, pointLongitude, pointLatitude, type)
);




CREATE TABLE sidStar (
    chartName VARCHAR(30),
    airportLongitude float(30) NOT NULL,
    airportLatitude float(30) NOT NULL,
    icao VARCHAR(20),
    type VARCHAR(10),
    dateAdded DATE,
    PRIMARY KEY (chartName),
    FOREIGN KEY (icao, airportLongitude, airportLatitude) REFERENCES airport(icao,longitude, latitude)
);



CREATE TABLE sidStar_navaid (
    chartName VARCHAR(30),
    pointId VARCHAR(20),
    pointLongitude FLOAT(30) NOT NULL,
    pointLatitude FLOAT(30) NOT NULL,
    type VARCHAR(10),
    nextSegment_chartName VARCHAR(30),
    nextSegment_pointId VARCHAR(20),
    nextSegment_pointIdLong FLOAT(30),
    nextSegment_pointIdLat FLOAT(30),
    nextSegment_waypointType VARCHAR(10),
    altitudeConstraint INT,
    PRIMARY KEY (chartName, pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (chartName) REFERENCES sidStar(chartName),
    FOREIGN KEY (pointId, pointLongitude, pointLatitude, type) REFERENCES waypoint(pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (nextSegment_chartName, nextSegment_pointId, nextSegment_pointIdLong, nextSegment_pointIdLat, nextSegment_waypointType) REFERENCES sidStar_navaid(chartName, pointId, pointLongitude, pointLatitude, type)
);

CREATE TABLE Airway (
    airwayIdent VARCHAR(10) PRIMARY KEY,
    type CHAR(1),
    minimumAltitude INT,
    maxAltitude INT
);



CREATE TABLE airway_route (
    airwayIdent VARCHAR(10),
    pointId VARCHAR(20),
    pointLongitude FLOAT(30) NOT NULL,
    pointLatitude FLOAT(30) NOT NULL,
    type VARCHAR(10),
    orderNumber INT,
    first VARCHAR(10),
    last VARCHAR(255),
    PRIMARY KEY (pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (airwayIdent) REFERENCES Airway(airwayIdent),
    FOREIGN KEY (pointId, pointLongitude, pointLatitude, type) REFERENCES waypoint(pointId, pointLongitude, pointLatitude, type)
);

