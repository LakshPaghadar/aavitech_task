import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';
@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "GetCategoriesResult")
  final List<String> getCategoriesResult;

  CategoryResponse({
    required this.getCategoriesResult,
  });

  CategoryResponse copyWith({
    List<String>? getCategoriesResult,
  }) =>
      CategoryResponse(
        getCategoriesResult: getCategoriesResult ?? this.getCategoriesResult,
      );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
