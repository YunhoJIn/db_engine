// MAU 정의
create  (a:EntityService {
            strName:'MAU', 
            strType:'Mariadb 10.5.8', 
            strIP:'127.0.0.1', 
            DBName:'BIService', 
            strComment:'월간 유니크 접속자 수'
        });

// YM 정의
match   (a:Attr {strName:'ConnDate'}) 
create  (a)-[:AttrTransform {
            strComment:'접속일에서 YYYY-MM 형태로 변경', 
            strType:'update'
        }]->(YM:Attr{
            strName:'YM', 
            strType:'string', 
            strComment:'접속월'
        });
match   (a:EntityService {strName:'MAU'}), 
        (b:Attr {strName:'YM'})
create (b)-[:AttrToSVC]->(a);

// MAUCnt 정의
match   (a:Attr {strName:'ConnID'})
create  (a)-[:AttrTransform {
            strComment:'월별 유니크한 ConnID 수 조회', 
            strType:'accurate'
        }]->(MAUCnt:Attr{
            strName:'MAUCnt', 
            strType:'bigint', 
            strComment:'유니크 접속자'
        });
match   (a:EntityService {strName:'MAU'}), 
        (b:Attr {strName:'MAUCnt'})
create (b)-[:AttrToSVC]->(a);
