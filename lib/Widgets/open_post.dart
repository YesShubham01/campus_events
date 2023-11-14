import 'package:animations/animations.dart';
import 'package:campus_events/Pages/EventPage/eventpage.dart';
import 'package:campus_events/Widgets/post.dart';
import 'package:flutter/material.dart';

class OpenablePost extends StatelessWidget {
  const OpenablePost({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: PostOfEvent(),
          ),
        );
      },
      openBuilder: (BuildContext context, VoidCallback _) {
        return const EventPage();
      },
      tappable:
          false, // Set to true if you want to allow tapping on the opened screen to close it
      closedShape: const RoundedRectangleBorder(),
      openShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      openElevation: 0.0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
    );
  }
}
