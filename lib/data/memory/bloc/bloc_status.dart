// 이번에 쓰진 않고 나중에 서버 / 로컬 데이터와 연동 시 bloc state를 관리할 때 enum 사용
enum BlocStatus {
  initial,
  loading,
  success,
  error,
}