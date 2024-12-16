import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserDto {
  final String userId;
  final String email;
  final String name;
  final List<String> favoriteBaskets;

  const UserDto({
    required this.userId,
    required this.email,
    required this.name,
    required this.favoriteBaskets,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
