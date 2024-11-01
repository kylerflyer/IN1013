
USE aviation;
CREATE TABLE point (
    pointId VARCHAR(20) ,
    longitude FLOAT(30) ,
    latitude FLOAT(30) ,
    name VARCHAR(30),
    primary key (pointId,longitude,latitude)
);

CREATE TABLE airport (
    icao VARCHAR(20),
    longitude FLOAT(30) ,
    latitude FLOAT(30),
    size CHAR(1),
    FOREIGN KEY (icao,longitude,latitude) REFERENCES point(pointId,longitude,latitude) ON DELETE CASCADE,
    PRIMARY KEY (icao,longitude,latitude)
);

CREATE TABLE waypoint (
    pointId VARCHAR(20),
    pointLongitude FLOAT(30),
    pointLatitude FLOAT(30),
    type VARCHAR(10),
    ident VARCHAR(30),
    region CHAR(2),
    PRIMARY KEY (pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (pointId,pointLongitude, pointLatitude) REFERENCES point(pointId,longitude, latitude) ON DELETE CASCADE
);

CREATE TABLE navaid (
    pointId VARCHAR(20),
    pointLongitude FLOAT(30),
    pointLatitude FLOAT(30),
    type VARCHAR(10),
    frequency FLOAT(6),
    elevation INT,
    primary key (pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (pointId, pointLongitude, pointLatitude, type) REFERENCES waypoint(pointId, pointLongitude, pointLatitude, type) ON DELETE CASCADE

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
    pointLongitude FLOAT(30),
    pointLatitude FLOAT(30),
    type varchar(10),
    orderNumber INT,
    first VARCHAR(10),
    last VARCHAR(255),
    PRIMARY KEY (airwayIdent, pointId, pointLongitude, pointLatitude,type),
    FOREIGN KEY (airwayIdent) REFERENCES Airway(airwayIdent) ON DELETE CASCADE,
    FOREIGN KEY (pointId,pointLongitude, pointLatitude,type) REFERENCES waypoint(pointId, pointLongitude, pointLatitude,type) ON DELETE CASCADE
);

CREATE TABLE sidStar (
    chartName VARCHAR(30),
    longitude FLOAT(30) ,
    latitude FLOAT(30),
    icao VARCHAR(20),
    type VARCHAR(10),
    PRIMARY KEY (chartName),
    FOREIGN KEY (icao,longitude,latitude) REFERENCES airport(icao,longitude,latitude) ON DELETE CASCADE
);

CREATE TABLE sidStar_navaid (
    chartName VARCHAR(30),
    pointId VARCHAR(20),
    pointLongitude FLOAT(30),
    pointLatitude FLOAT(30),
    type VARCHAR(10),
    altitudeContraint INT,
    orderPlacement INT,
    PRIMARY KEY (chartName, pointId, pointLongitude, pointLatitude, type),
    FOREIGN KEY (chartName) REFERENCES sidStar(chartName) ON DELETE CASCADE,
    FOREIGN KEY (pointId,pointLongitude, pointLatitude, type) REFERENCES waypoint(pointId,pointLongitude, pointLatitude, type) ON DELETE CASCADE
);

CREATE TABLE sidStar_airway (
    chartName VARCHAR(30),
    airwayIdent VARCHAR(10),
    orderPlacement INT,
    PRIMARY KEY (chartName, airwayIdent),
    FOREIGN KEY (chartName) REFERENCES sidStar(chartName) ON DELETE CASCADE,
    FOREIGN KEY (airwayIdent) REFERENCES Airway(airwayIdent) ON DELETE CASCADE
);


