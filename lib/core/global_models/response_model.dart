import 'package:flutter_arch_example_riverpod/ui/views/discover/model/movie_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'response_model.freezed.dart';
part 'response_model.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    @JsonKey(name: 'page') int? page,
    @JsonKey(name: 'results') List<MovieItem>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}