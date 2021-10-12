$ClusterNetworkName = "Cluster Network Name" # 클러스터 네트워크 이름
$IPResourceName = "ClusterCore IP Resource Name" # 클러스터 코어 ip 리소스명
$ClusterCoreIP = "xxx.xxx.xxx.xxx" # 클러스터 코어 ip
[int]$ClusterProbePort = 58888 # 클러스터 코어 상태 체크 Port

Import-Module FailoverClusters

Get-ClusterResource $IPResourceName | Set-ClusterParameter -Multiple @{"Address"="$ClusterCoreIP";"ProbePort"=$ClusterProbePort;"SubnetMask"="255.255.255.255";"Network"="$ClusterNetworkName";"EnableDhcp"=0}