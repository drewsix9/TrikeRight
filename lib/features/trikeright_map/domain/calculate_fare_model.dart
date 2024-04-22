class CalculateFareModel {
  String? totalFare;
  String? totalDistance;
  String? totalDuration;

  CalculateFareModel({this.totalFare, this.totalDistance, this.totalDuration});

  CalculateFareModel.fromJson(Map<String, dynamic> json) {
    totalFare = json['total_fare'];
    totalDistance = json['total_distance'];
    totalDuration = json['total_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_fare'] = totalFare;
    data['total_distance'] = totalDistance;
    data['total_duration'] = totalDuration;
    return data;
  }
}
