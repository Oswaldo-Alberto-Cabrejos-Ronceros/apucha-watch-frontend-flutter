import 'package:json_annotation/json_annotation.dart';
part 'cared_profile_minimun_response.g.dart';

@JsonSerializable()
class CaredProfileMinimunResponse {
  final int id;
  CaredProfileMinimunResponse({
    required this.id,
  });
    factory CaredProfileMinimunResponse.fromJson(Map<String, dynamic> json) =>
      _$CaredProfileMinimunResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CaredProfileMinimunResponseToJson(this);
}