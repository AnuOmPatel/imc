import 'package:json_annotation/json_annotation.dart';

part 'near_by_beat_request.g.dart';

@JsonSerializable()
class NearByBeatRequest {
  final String action;
  final List<List<List<List<double>>>> coordinates;

  NearByBeatRequest({required this.action, required this.coordinates});

  Map<String, dynamic> toJson() {
    return {
      'action': action,
      'coordinates': coordinates,
    };
  }

  factory NearByBeatRequest.fromJson(Map<String, dynamic> json) {
    return NearByBeatRequest(
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
