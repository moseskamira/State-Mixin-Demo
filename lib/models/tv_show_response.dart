import 'package:custom_loader_state_mixin/models/tv_show.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_response.g.dart';

@JsonSerializable()
class TvShowResponse {
  String? total;
  int? page;
  int? pages;

  @JsonKey(name: 'tv_shows')
  List<TvShow>? tvShows;

  TvShowResponse(this.page, this.pages, this.total, this.tvShows);

  factory TvShowResponse.fromJson(Map<String, dynamic> json) =>
      _$TvShowResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowResponseToJson(this);
}
