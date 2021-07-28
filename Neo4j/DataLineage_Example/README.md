# 요약
 - source : 원천데이터
 - bigdata : 원천데이터를 모으는 Big Data System
 - Stage : 데이터를 1차 가공하여 저장한 Data Warehouse
 - Service : 고객 또는 내부에서 확인할 수 있는 최종 데이터
# 데이터 흐음
 - source -> bigdata -> Stage -> Service
# 전체 데이터 조회 Cypher
match (n)-[r]->(m) return *
