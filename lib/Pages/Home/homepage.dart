import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:campus_events/Provider/party_provider.dart';
import 'package:campus_events/Widgets/open_post.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorizeColors = [
    Colors.white,
    Colors.purple,
    Colors.yellow,
    Colors.deepPurple,
  ];

  final colorizeTextStyle = const TextStyle(
      fontSize: 50.0, fontFamily: 'Horizon', color: Colors.white);

  @override
  Widget build(BuildContext context) {
    final partyProvider = Provider.of<PartyProvider>(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.deepPurple.shade300,
          body: ListView(
            children: [
              _getAnimatedClubNamesText(),

              // i want to design glass like background for post.
              // an opacity of 1 is "neutral"
              const Divider(
                thickness: 3,
              ),

              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'Upcoming Events',
                      textStyle: const TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'Horizon',
                          color: Colors.white),
                      colors: colorizeColors,
                    ),
                  ],
                  repeatForever: true,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const OpenablePost(),
              const OpenablePost(),
              const OpenablePost(),
              const OpenablePost(),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: partyProvider.partyController,
          blastDirection: pi / 2,
          gravity: 0.01,
        ),
      ],
    );
  }

  _getAnimatedClubNamesText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'CLUBS',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            ColorizeAnimatedText(
              'MANAN',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            ColorizeAnimatedText(
              'GeeksMan',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
            ColorizeAnimatedText(
              'UCC & DA',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          repeatForever: true,
        ),
      ),
    );
  }
}
