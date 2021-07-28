create  (IPInfo:EntityBigdata{
            strName:'IPInfo', 
            strType:'hdfs', 
            strIP:'127.0.0.1', 
            path:'/Common/IPinfo', 
            strComment:'ip 정보'
        }),
        (IP:Attr{
            strName:'IP', 
            strType:'string', 
            strComment:'IP 주소'
        })-[:AttrToBig]->(IPInfo),
        (City:Attr{
            strName:'City', 
            strType:'string', 
            strComment:'도시명'
        })-[:AttrToBig]->(IPInfo);