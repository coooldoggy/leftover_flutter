class TicketInfo {
  int id;
  String name;
  int totalCnt;
  int leftCnt;
  int color;
  String startDate;
  String endDate;
  String location;
  String memo;

  TicketInfo(
      {required this.id,
      required this.name,
      required this.totalCnt,
      required this.leftCnt,
      required this.color,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.memo});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'totalCnt': totalCnt,
      'leftCnt': leftCnt,
      'color': color,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'memo': memo,
    };
  }
}
