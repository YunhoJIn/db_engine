// EntityBigdata Node에 LoginLog 생성
create  (LoginLog:EntityBigdata{
            strName:'LoginLog', 
            strType:'hdfs', 
            strIP:'127.0.0.1', 
            path:'/Logs/LoginLog', 
            strComment:'사용자 로그인 정보'
        });

// 변경없는 속성 연결
match   (a:Attr)-[b:AttrToSrc]->(c:EntitySource {strName:'LoginLog'}),
        (d:EntityBigdata {strName:'LoginLog'})
where   a.strName<>'UserName'
create  (a)-[:AttrToBig]->(d);

// 익명처리
match   (a:Attr {strName:'UserName'}) 
create  (a)-[b:AttrTransform {
                strComment:'데이터 익명처리', 
                strType:'update'
            }]->(anonymous:Attr{
                strName:'anonymous', 
                strType:'string', 
                strComment:'사용자명 익명'
            });
match   (a:Attr {strName:'anonymous'}), 
        (d:EntityBigdata {strName:'LoginLog'})
create (a)-[:AttrToBig]->(d);
