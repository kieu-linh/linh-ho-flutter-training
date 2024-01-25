class VideoBaseModel {
  String? url;
  int? width;
  int? height;
  int? size;

  VideoBaseModel();

  factory VideoBaseModel.fromJson(Map<String, dynamic> listVideo) {
    return VideoBaseModel()
      ..url = listVideo['url'] as String?
      ..width = listVideo['width'] as int?
      ..height = listVideo['height'] as int?
      ..size = listVideo['size'] as int?;
  }
}
