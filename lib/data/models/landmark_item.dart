class LandmarkItem {
  LandmarkItem({this.id, required this.landmark, required this.createDate});

  final int? id;

  final String landmark;

  final DateTime createDate;

  LandmarkItem copyWith({
    int? id,
    String? landmark,
    DateTime? createDate,
  }) {
    return LandmarkItem(
      id: id ?? this.id,
      landmark: landmark ?? this.landmark,
      createDate: createDate ?? this.createDate,
    );
  }
}