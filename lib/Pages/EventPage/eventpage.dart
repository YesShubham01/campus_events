import 'dart:math';

import 'package:campus_events/Provider/party_provider.dart';
import 'package:campus_events/Widgets/glassmorphism.dart';
import 'package:campus_events/Widgets/neumorphism.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> with TickerProviderStateMixin {
  bool isLiked = false;
  bool isSaved = false;
  bool isRegisted = false;

  late AnimationController _like_controller;
  late AnimationController _save_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _like_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _save_controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final partyProvider = Provider.of<PartyProvider>(context);
    const String sampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
          ),
          backgroundColor: Colors.deepPurple.shade300,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const NeumorphisimContainer(
                    height: 180,
                  ),
                  const SizedBox(height: 30),
                  const Glass(
                    height: 280,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          sampleText,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Glass(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            IconButton(
                              splashRadius: 40,
                              iconSize: 38,
                              onPressed: () {
                                if (_like_controller.status ==
                                    AnimationStatus.dismissed) {
                                  _like_controller.reset();
                                  _like_controller.animateTo(0.6);
                                } else {
                                  _like_controller.reverse();
                                }
                              },
                              icon: Lottie.asset(Icons8.heart_color,
                                  controller: _like_controller),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isRegisted = !isRegisted;
                                  });
                                  if (isRegisted) {
                                    partyProvider.startParty();
                                  }
                                },
                                child:
                                    Text(isRegisted ? "Registered" : "Register",
                                        style: TextStyle(
                                          fontSize: 26,
                                          color: isRegisted
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.7),
                                        )),
                              ),
                            ),
                            IconButton(
                              splashRadius: 40,
                              iconSize: 38,
                              onPressed: () {
                                if (_save_controller.status ==
                                    AnimationStatus.dismissed) {
                                  _save_controller.reset();
                                  _save_controller.animateTo(0.6);
                                } else {
                                  _save_controller.reverse();
                                }
                              },
                              icon: Lottie.asset(Icons8.icons8_bookmark_23_,
                                  controller: _save_controller),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
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
}
