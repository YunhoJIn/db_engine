
$ClusterNetworkName = "Cluster Network Name" # 클러스터 네트워크 이름
$IPResourceName = "Listener IP REsource Name" #AG Listener IP 리소스명
$ListenerILBIP = "xxx.xxx.xxx.xxx" # AG Listener IP
[int]$ListenerProbePort = 59999 # AG 상태 체크 Port

Import-Module FailoverClusters

Get-ClusterResource $IPResourceName | Set-ClusterParameter -Multiple @{"Address"="$ListenerILBIP";"ProbePort"=$ListenerProbePort;"SubnetMask"="255.255.255.255";"Network"="$ClusterNetworkName";"EnableDhcp"=0}