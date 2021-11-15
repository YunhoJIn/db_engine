# 연결 문자열 선언
$ConnectionString = "Data Source=.\sqlexpress; 
initial catalog=master; 
User Id=<UserID>; 
Password=<PWD>; 
Pooling=true; 
application name=ConnPoolTest;"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$SqlConnection.Open()

# 쿼리 선언
$Command = $SqlConnection.CreateCommand()
$Command.CommandText = "SELECT session_id, PROGRAM_NAME, status 
FROM sys.dm_exec_sessions 
WHERE PROGRAM_NAME LIKE 'ConnPoolTest%'"

# SELECT 쿼리 진행 후 결과값 생성
$Reader = $Command.ExecuteReader()

# 출력
while($Reader.Read() = "True"){write-host $Reader[0]',' $Reader[1]',' $Reader[2]}

# 객체 제거
$Reader.Close()
$SqlConnection.Close()
$SqlConnection.Dispose()