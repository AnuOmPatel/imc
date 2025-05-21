
import 'package:json_annotation/json_annotation.dart';

part 'ward_master_request.g.dart';

@JsonSerializable()
class WardMasterRequestByZone{
  final String action;
  final String zone_id;

  WardMasterRequestByZone({required this.action, required this.zone_id});

  Map<String, dynamic> toJson() => {
    'action': action,
    'zone_id': zone_id,
  };
}