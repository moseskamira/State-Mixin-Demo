import 'package:json_annotation/json_annotation.dart';

part 'tv_show.g.dart';

@JsonSerializable()
class TvShow {
  int? id;
  String? name;
  String? permalink;

  @JsonKey(name: 'start_date')
  String? startDate;

  @JsonKey(name: 'end_date')
  String? endDate;

  String? country;
  String? network;
  String? status;

  @JsonKey(name: 'image_thumbnail_path')
  String? imageThumbnailPath;

  TvShow(
    this.status,
    this.name,
    this.id,
    this.network,
    this.country,
    this.endDate,
    this.imageThumbnailPath,
    this.permalink,
    this.startDate,
  );

  factory TvShow.fromJson(Map<String, dynamic> json) => _$TvShowFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowToJson(this);
}
