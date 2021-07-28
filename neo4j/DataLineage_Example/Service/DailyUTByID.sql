// DailyUTByID 정의
create  (a:EntityService {
            strName:'DailyUTByID', 
            strType:'Mariadb 10.5.8', 
            strIP:'127.0.0.1', 
            DBName:'BIService', 
            strComment:'ID별 일간 이용시간'
        });

// ConnDuration 연산 및 정의
match   (a:Attr {strName:'ConnDuration'}) 
create  (a)-[:AttrTransform {
            strComment:'일별 ID별 이용시간 합계 처리', 
            strType:'accurate'
        }]->(DUTUDuration:Attr{
            strName:'DUTUDuration', 
            strType:'bigint', 
            strComment:'아이디별 일간 이용 시간'
        });
match   (a:EntityService {strName:'DailyUTByID'}), 
        (b:Attr {strName:'DUTUDuration'}) 
create (b)-[:AttrToSVC]->(a);

// 기 생성 속성 연결
match   (a:EntityService {strName:'DailyUTByID'}), 
        (b:Attr {strName:'YMD'})
create (b)-[:AttrToSVC]->(a);
match   (a:EntityService {strName:'DailyUTByID'}), 
        (b:Attr {strName:'ConnID'})
create (b)-[:AttrToSVC]->(a);
