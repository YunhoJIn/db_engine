// DAU 정의
create  (a:EntityService {
            strName:'DAU', 
            strType:'Mariadb 10.5.8', 
            strIP:'127.0.0.1', 
            DBName:'BIService', 
            strComment:'일간 유니크 접속자 수'
        });

// YMD 정의
match   (a:Attr {strName:'ConnDate'}) 
create  (a)-[:AttrTransform {
            strComment:'접속일에서 YYYY-MM-DD 형태로 변경', 
            strType:'update'
        }]->(YMD:Attr{
                strName:'YMD', 
                strType:'string', 
                strComment:'접속일'
            });
match   (a:EntityService {strName:'DAU'}), 
        (b:Attr {strName:'YMD'}) 
create (b)-[:AttrToSVC]->(a);

// DAUCnt 정의
match   (a:Attr {strName:'ConnID'}) 
create  (a)-[:AttrTransform {
            strComment:'데일리로 유니크한 ConnID 수 조회', 
            strType:'accurate'
        }]->(DAUCnt:Attr{
            strName:'DAUCnt', 
            strType:'bigint', 
            strComment:'유니크 접속자'
        });
match   (a:EntityService {strName:'DAU'}), 
        (b:Attr {strName:'DAUCnt'})
create (b)-[:AttrToSVC]->(a);
