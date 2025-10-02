import 'package:json_annotation/json_annotation.dart';
part 'cared_senior_citizen_request.g.dart';

@JsonSerializable()
class CaredSeniorCitizenRequest {
  final int carerProfileId;
  final int seniorCitizenProfileId;
  CaredSeniorCitizenRequest({
    required this.carerProfileId,
    required this.seniorCitizenProfileId,
  });
    factory CaredSeniorCitizenRequest.fromJson(Map<String, dynamic> json) =>
      _$CaredSeniorCitizenRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CaredSeniorCitizenRequestToJson(this);
}