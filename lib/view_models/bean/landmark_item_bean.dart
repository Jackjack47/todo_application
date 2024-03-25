class LandmarkItemBean {
  LandmarkItemBean({this.id, required this.landmark, required this.createDate});

  final int? id;

  final String landmark;

  final DateTime createDate;

  LandmarkItemBean copyWith({
    int? id,
    String? landmark,
    DateTime? createDate,
  }) {
    return LandmarkItemBean(
      id: id ?? this.id,
      landmark: landmark ?? this.landmark,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  String toString() {
    return 'LandmarkItemBean{id: $id, landmark: $landmark, createDate: $createDate}';
  }
}
