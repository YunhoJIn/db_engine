// EntityStage Node 생성
create  (a:EntityStage {
            strName:'ConnectInfo', 
            strType:'SQL DW', 
            strIP:'127.0.0.1', 
            DBName:'Analysis', 
            strComment:'접속 정보 저장'
        });

// ConnDate 정의
match   (a:Attr {strName:'LoginDate'}) 
create  (a)-[:AttrTransform {
                strComment:'LoginDate를 네이밍 변경', 
                strType:'update'
            }]->(ConnDate:Attr{
                strName:'ConnDate', 
                strType:'date', 
                strComment:'접속일'
            });
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'ConnDate'})
create (b)-[:AttrToStage]->(a);

// ConnID 정의 - call 부분은 Cypher의 SubQuery
create  (ConnID:Attr{
            strName:'ConnID', 
            strType:'string', 
            strComment:'접속 ID'
        });
match   (a:Attr{strName:'ConnID'})
call    {
    with    a
    match   (b:Attr)    
    where   b.strName in ['LoginID', 'LogoutID']    
    return  b
}
create  (b)-[:AttrTransform {
                strComment:'LoginID와 
                    LogoutID를 Date Union 후 
                    Ordering 하고 Grouping', 
                strType:'Grouping'
            }]->(a);
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'ConnID'}) 
create (b)-[:AttrToStage]->(a);

// ConnDuration 정의
create  (ConnDuration:Attr{
            strName:'ConnDuration', 
            strType:'bigint', 
            strComment:'로그인부터 로그아웃까지 체류 시간'
        });
match   (a:Attr{strName:'ConnDuration'})
call    {
    with    a
    match   (b:Attr)    
    where   b.strName in ['LoginDate', 'LogoutDate']    
    return  b
}
create  (b)-[:AttrTransform {
                strComment:'LoginDate ~ 
                    LogoutDate의 기간을 초로 저장', 
                strType:'accurate'
            }]->(a);
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'ConnDuration'})
create (b)-[:AttrToStage]->(a);

// LoginCity 및 LogoutCity 정의 
match   (a:Attr {strName:'City'}) 
create  (a)-[:AttrTransform {
            strComment:'LoginIP와 IP를 조회하여 
                Login 시 City 정보 조회', 
            strType:'Join'
        }]->(LoginCity:Attr{
            strName:'LoginCity', 
            strType:'string', 
            strComment:'접속 시도 도시
        '});
match   (a:Attr {strName:'City'}) 
create  (a)-[:AttrTransform {
            strComment:'LogoutIP와 IP를 조회하여 
                Logout 시 City 정보 조회', 
            strType:'Join'
        }]->(LogoutCity:Attr{
            strName:'LogoutCity', 
            strType:'string', 
            strComment:'접속 해제 도시'
        });
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'LoginCity'}) 
create  (b)-[:AttrToStage]->(a);
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'LogoutCity'}) 
create  (b)-[:AttrToStage]->(a);

// 이미 정의된 속성 연결
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'anonymous'})
create  (b)-[:AttrToStage]->(a);
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'LoginIP'})
create  (b)-[:AttrToStage]->(a);
match   (a:EntityStage {strName:'ConnectInfo'}), 
        (b:Attr {strName:'LogoutIP'}) 
create  (b)-[:AttrToStage]->(a);