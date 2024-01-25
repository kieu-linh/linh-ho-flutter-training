import 'package:flutter_api_example/models/video_base_model.dart';

class VideoModel {
  VideoBaseModel? large;
  VideoBaseModel? medium;
  VideoBaseModel? small;
  VideoBaseModel? tiny;

  VideoModel();

  factory VideoModel.fromJson(Map<String, dynamic> list) {
    return VideoModel()
      ..large = list['large'] == null
          ? null
          : VideoBaseModel.fromJson(list['large'] as Map<String, dynamic>)
      ..medium = list['medium'] == null
          ? null
          : VideoBaseModel.fromJson(list['medium'] as Map<String, dynamic>)
      ..small = list['small'] == null
          ? null
          : VideoBaseModel.fromJson(list['small'] as Map<String, dynamic>)
      ..tiny = list['tiny'] == null
          ? null
          : VideoBaseModel.fromJson(list['tiny'] as Map<String, dynamic>);
  }
}
