import 'package:apucha_watch_movil/features/cared_senior_citizen/domain/models/cared_profile_minimun_response.dart';
import 'package:apucha_watch_movil/features/cared_senior_citizen/domain/models/senior_citizen_profile_minimun_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cared_senior_citizen_response.g.dart';

@JsonSerializable()
class CaredSeniorCitizenResponse {
  final int id;
  final CaredProfileMinimunResponse caredProfile;
  final SeniorCitizenProfileMinimunResponse seniorCitizenProfile;
  final String createAt;
  CaredSeniorCitizenResponse({
    required this.id,
    required this.caredProfile,
    required this.seniorCitizenProfile,
    required this.createAt,
  });

    factory CaredSeniorCitizenResponse.fromJson(Map<String, dynamic> json) =>
      _$CaredSeniorCitizenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CaredSeniorCitizenResponseToJson(this);
}