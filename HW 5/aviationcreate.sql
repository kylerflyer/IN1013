
use aviation;

/*INSERT INTO point (pointId, longitude, latitude, name)
VALUES 
('WP01', -73.870, 40.760, 'Waypoint A'),
('WP02', -118.300, 34.050, 'Waypoint B'),
('JFK', -73.7781, 40.6413, 'John f kennedy'),
('LAX', -118.4085, 33.9416, 'Los Angeles');

-- Insert data into the waypoint table
INSERT INTO waypoint (pointId, pointLongitude, pointLatitude, type, ident, region)
VALUES 
('WP01', -73.870, 40.760, 'WP', 'WPA', 'US'),
('WP02', -118.300, 34.050, 'WP', 'WPB', 'US');

-- Insert data into the navaid table
INSERT INTO navaid (pointId, pointLongitude, pointLatitude, type, frequency, elevation)
VALUES 
('WP01', -73.870, 40.760, 'VOR', 113.0, 300),
('WP02', -118.300, 34.050, 'NDB', 350.5, 250);

INSERT INTO airway (airwayIdent, type, minimumAltitude, maxAltitude)
VALUES 
('A1', 'H', 10000, 30000),
('B2', 'L', 5000, 20000);
*/


/*INSERT INTO airport (icao, longitude, latitude, size)
VALUES 
('JFK', -73.7781, 40.6413, 'L'),
('LAX', -118.4085, 33.9416, 'L');
*/
-- Insert data into the sidstar table
INSERT INTO sidstar (chartName, icao, longitude, latitude, type)
VALUES 
('SID01', 'JFK',-73.7781, 40.6413, 'SID'),
('ALBEY02', 'JFK',-73.7781, 40.6413, 'SID'),
('STAR01', 'LAX', -118.4085, 33.9416,'STAR');

-- Insert data into the sidstar_airway table
INSERT INTO sidstar_airway (chartName, airwayIdent, orderPlacement)
VALUES 
('SID01', 'A1', 1),
('SID01', 'B2', 2);

-- Insert data into the airway table


-- Insert data into the sidstar_navaid table
INSERT INTO sidstar_navaid (chartName, pointId, pointLongitude, pointLatitude, type, altitudeContraint, orderPlacement)
VALUES 
('SID01', 'WP01', -73.870, 40.760, 'VOR', 12000, 1),
('STAR01', 'WP02', -118.300, 34.050, 'NDB', 10000, 2);

-- Insert data into the point table


-- Insert data into the airway_route table

