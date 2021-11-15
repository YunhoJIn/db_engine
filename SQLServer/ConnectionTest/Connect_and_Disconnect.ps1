# Windows Account 연결문
# $ConnectionString = "Data Source=.\sqlexpress;initial catalog=master; trusted_connection=true; application name=ConnPoolTest"

# SQL Account 연결문
$ConnectionString = "Data Source=.\sqlexpress;initial catalog=master; User Id=<UID>; Password=<PWD>; Pooling=true; application name=ConnPoolTest"
$SqlConnection1 = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$SqlConnection2 = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$SqlConnection3 = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$SqlConnection4 = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)
$SqlConnection5 = New-Object System.Data.SqlClient.SqlConnection($ConnectionString)

$SqlConnection1.Open()
$SqlConnection2.Open()
$SqlConnection3.Open()
$SqlConnection4.Open()
$SqlConnection5.Open()

$SqlConnection1.close()
$SqlConnection2.close()
$SqlConnection3.close()
$SqlConnection4.close()
$SqlConnection5.close()

$SqlConnection1.Dispose()
$SqlConnection2.Dispose()
$SqlConnection3.Dispose()
$SqlConnection4.Dispose()
$SqlConnection5.Dispose()

Write-Host "Connection1 State: $($SqlConnection1.State)" -ForegroundColor Magenta
Write-Host "Connection2 State: $($SqlConnection2.State)" -ForegroundColor Magenta
Write-Host "Connection3 State: $($SqlConnection3.State)" -ForegroundColor Magenta
Write-Host "Connection4 State: $($SqlConnection4.State)" -ForegroundColor Magenta
Write-Host "Connection5 State: $($SqlConnection5.State)" -ForegroundColor Magenta