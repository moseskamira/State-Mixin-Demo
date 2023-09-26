// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowResponse _$TvShowResponseFromJson(Map<String, dynamic> json) =>
    TvShowResponse(
      json['page'] as int?,
      json['pages'] as int?,
      json['total'] as String?,
      (json['tv_shows'] as List<dynamic>?)
          ?.map((e) => TvShow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvShowResponseToJson(TvShowResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'tv_shows': instance.tvShows,
    };
