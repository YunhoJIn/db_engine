create  (LogoutLog:EntitySource{
            strName:'LogoutLog', 
            strSourceType:'Mariadb 10.5.8', 
            strSourceIP:'127.0.0.1', 
            strSourceDB:'Logs', 
            strComment:'사용자 로그아웃 정보'
        }),
        (LogoutDate:Attr{
            strName:'LogoutDate', 
            strType:'date', 
            strComment:'접속 해재일'
        })-[:AttrToSrc]->(LogoutLog),
        (LogoutID:Attr{
            strName:'LogoutID', 
            strType:'string', 
            strComment:'접속 해재된 아이디'
        })-[:AttrToSrc]->(LogoutLog),
        (LogoutIP:Attr{
            strName:'LogoutIP', 
            strType:'string', 
            strComment:'접속 해재 시 IP'
        })-[:AttrToSrc]->(LogoutLog);