import 'package:flutter_api_example/models/video_model.dart';

class HitModel {
  int? id;
  String? pageURL;
  String? type;
  String? tags;
  int? duration;
  String? pictureId;
  VideoModel? video;
  int? views;
  int? downloads;
  int? likes;
  int? comments;
  int? user_id;
  String? user;
  String? userImageURL;

  HitModel();

  factory HitModel.fromJson(Map<String, dynamic> listHit) {
    return HitModel()
      ..id = listHit['id'] as int?
      ..pageURL = listHit['pageURL'] as String?
      ..type = listHit['type'] as String?
      ..tags = listHit['tags'] as String?
      ..duration = listHit['duration'] as int?
      ..pictureId = listHit['picture_id'] as String?
      ..video = listHit['videos'] == null
          ? null
          : VideoModel?.fromJson(listHit['videos'] as Map<String, dynamic>);
  }
}



