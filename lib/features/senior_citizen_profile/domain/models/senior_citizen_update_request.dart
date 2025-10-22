import 'package:json_annotation/json_annotation.dart';
part 'senior_citizen_update_request.g.dart';

@JsonSerializable()
class SeniorCitizenUpdateRequest {
  final String? name;
  final String? lastname;
  final String? birthdate;

  SeniorCitizenUpdateRequest({this.name, this.lastname, this.birthdate});
  factory SeniorCitizenUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$SeniorCitizenUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SeniorCitizenUpdateRequestToJson(this);
}
