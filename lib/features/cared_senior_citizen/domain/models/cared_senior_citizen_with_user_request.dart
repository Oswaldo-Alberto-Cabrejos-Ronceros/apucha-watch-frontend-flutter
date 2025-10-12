import 'package:json_annotation/json_annotation.dart';
part 'cared_senior_citizen_with_user_request.g.dart';

@JsonSerializable()
class CaredSeniorCitizenWithUserRequest {
  final String userId;
  final int seniorCitizenProfileId;
  CaredSeniorCitizenWithUserRequest({
    required this.userId,
    required this.seniorCitizenProfileId,
  });
  factory CaredSeniorCitizenWithUserRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$CaredSeniorCitizenWithUserRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$CaredSeniorCitizenWithUserRequestToJson(this);
}
