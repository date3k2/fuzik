import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()

class Group
{
      int? id;
      final String? name;
      final DateTime createdAt;
      Group({required this.id, this.name, required this.createdAt});
      factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
      Map<String, dynamic> toJson() => _$GroupToJson(this);
}