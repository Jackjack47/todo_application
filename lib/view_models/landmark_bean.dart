class LandmarkBean {
  LandmarkBean({this.id, required this.landmark, required this.createDate});

  final int? id;

  final String landmark;

  final DateTime createDate;

  LandmarkBean copyWith({
    int? id,
    String? landmark,
    DateTime? createDate,
  }) {
    return LandmarkBean(
      id: id ?? this.id,
      landmark: landmark ?? this.landmark,
      createDate: createDate ?? this.createDate,
    );
  }
}
