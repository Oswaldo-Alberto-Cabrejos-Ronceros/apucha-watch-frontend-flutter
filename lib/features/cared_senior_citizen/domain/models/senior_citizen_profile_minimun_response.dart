import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_profile_minimun_response.g.dart';

@JsonSerializable()
class SeniorCitizenProfileMinimunResponse {
  final int id;
  SeniorCitizenProfileMinimunResponse({
    required this.id,
  });
    factory SeniorCitizenProfileMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenProfileMinimunResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeniorCitizenProfileMinimunResponseToJson(this);
}