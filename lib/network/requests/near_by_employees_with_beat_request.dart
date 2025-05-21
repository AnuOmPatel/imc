import 'package:json_annotation/json_annotation.dart';

part 'near_by_employees_with_beat_request.g.dart';

@JsonSerializable()
class NearByEmployeesWithBeatRequest {
  final String? action;
  final List<List<List<List<double>>>> coordinates;

  const NearByEmployeesWithBeatRequest({
    required this.action, required this.coordinates
  });

  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'coordinates': coordinates,
    };
  }


  factory NearByEmployeesWithBeatRequest.fromJson(Map<String, dynamic> json) {
    return NearByEmployeesWithBeatRequest(
      action: json['action'],
      coordinates: List<List<List<List<double>>>>.from(
        json['coordinates'].map((x) => List<List<List<double>>>.from(
            x.map((x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x))
            ))
        )),
      ),
    );
  }

}
