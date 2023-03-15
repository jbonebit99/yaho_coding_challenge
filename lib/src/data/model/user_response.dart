import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<User>? data,
    Support? support,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, Object?> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? avatar,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class Support with _$Support {
  const factory Support({String? text, String? url}) = _Support;

  factory Support.fromJson(Map<String, Object?> json) =>
      _$SupportFromJson(json);
}
