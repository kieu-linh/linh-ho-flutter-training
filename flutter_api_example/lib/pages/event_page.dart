import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api_example/models/event_model.dart';
import 'package:flutter_api_example/pages/video_page.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late VideoPlayerController videoPlayerController;
  late EventModel event = EventModel();

  Future<http.Response> fetchEvent() async {
    return await http.get(Uri.parse(
        'https://pixabay.com/api/videos/?key=23361083-8bb4d7be8c9cfe6723a356cda&q=candy&pretty=true'));
  }

  @override
  void initState() {
    super.initState();
    fetchEvent().then((value) {
      final data = jsonDecode(value.body);
      event = EventModel.fromJson(data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return VideoPage(linkVideo: event.hits?[index].video?.tiny?.url);
            // return Placeholder();
          },
          separatorBuilder: (_, __) {
            return const SizedBox(height: 10.0);
          },
          itemCount: event.hits?.length ?? 0),
    );
  }
}
