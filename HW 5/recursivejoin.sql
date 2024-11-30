

-- Define the chart name you want to retrieve
SET @chartName := 'DELTA6Y';

/*WITH RECURSIVE power_chain AS (
    -- Anchor member: Start with the last point where nextSegment_waypointId is NULL
    SELECT 
        pointId,
        nextSegment_waypointId,
        chartName
    FROM 
        sidStar_routing
    WHERE 
        chartName = 'DELTA6Y'
        AND nextSegment_waypointId IS NULL

    UNION ALL

    -- Recursive member: Find the previous segment in the path
    SELECT 
        s.pointId,
        s.nextSegment_waypointId,
        s.chartName
    FROM 
        sidStar_routing s
    INNER JOIN 
        power_chain pc ON s.nextSegment_waypointId = pc.pointId
    WHERE 
        s.chartName = 'DELTA6Y'
)

-- Final selection to output the routing path in reverse order

SELECT * FROM power_chain;*/


WITH RECURSIVE power_chain AS (
    -- Anchor member: Start with the last point where nextSegment_waypointId is NULL
    SELECT 
        pointId,
        nextSegment_waypointId,
        chartName,
        1 AS level -- Start at level 1 for the first row
    FROM 
        sidStar_routing
    WHERE 
        chartName = 'DELTA6Y'
        AND nextSegment_waypointId IS NULL

    UNION ALL

    -- Recursive member: Find the previous segment in the path
    SELECT 
        s.pointId,
        s.nextSegment_waypointId,
        s.chartName,
        pc.level + 1 AS level -- Increment level at each recursion
    FROM 
        sidStar_routing s
    INNER JOIN 
        power_chain pc ON s.nextSegment_waypointId = pc.pointId
    WHERE 
        s.chartName = 'DELTA6Y'
)

-- Final selection to output the routing path in reverse order
SELECT *
FROM power_chain
 join point on point.pointId=power_chain.pointId ORDER BY level DESC; -- Reverse the order by sorting levels in descending order






