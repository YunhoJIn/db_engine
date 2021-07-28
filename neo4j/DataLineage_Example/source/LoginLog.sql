create  (LoginLog:EntitySource{
            strName:'LoginLog', 
            strSourceType:'Mariadb 10.5.8', 
            strSourceIP:'127.0.0.1', 
            strSourceDB:'Logs', 
            strComment:'사용자 로그인 정보'
        }),
        (LoginDate:Attr{
            strName:'LoginDate', 
            strType:'date', 
            strComment:'접속일'
        })-[:AttrToSrc]->(LoginLog),
        (LoginID:Attr{
            strName:'LoginID', 
            strType:'string', 
            strComment:'접속ID'
        })-[:AttrToSrc]->(LoginLog),
        (LoginIP:Attr{
            strName:'LoginIP',
            strType:'string', 
            strComment:'접속IP'
        })-[:AttrToSrc]->(LoginLog),
        (UserName:Attr{
            strName:'UserName', 
            strType:'string', 
            strComment:'사용자명'
        })-[:AttrToSrc]->(LoginLog);
