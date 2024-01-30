import 'package:flutter_api_example/models/hit_model.dart';

class EventModel {
  int? total;
  int? totalHits;
  List<HitModel>? hits;

  EventModel();
  factory EventModel.fromJson(Map<String, dynamic> listEvent) {
    return EventModel()
      ..total = listEvent['total'] as int?
      ..totalHits = listEvent['totalHits'] as int?
      ..hits = (listEvent['hits'] as List<dynamic>?)
          ?.map((e) => HitModel.fromJson(e as Map<String, dynamic>))
          .toList();
  }
}
