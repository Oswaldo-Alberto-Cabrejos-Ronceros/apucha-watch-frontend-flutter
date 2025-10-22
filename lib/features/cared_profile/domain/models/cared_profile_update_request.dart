import 'package:json_annotation/json_annotation.dart';

part 'cared_profile_update_request.g.dart';

@JsonSerializable()
class CaredProfileUpdateRequest {
  final String? name;
  final String? lastname;

  CaredProfileUpdateRequest({this.name, this.lastname});

  factory CaredProfileUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CaredProfileUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CaredProfileUpdateRequestToJson(this);
}
