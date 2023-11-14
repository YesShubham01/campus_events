import 'package:campus_events/Provider/party_provider.dart';
import 'package:campus_events/Widgets/glassmorphism.dart';
import 'package:campus_events/Widgets/neumorphism.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PostOfEvent extends StatefulWidget {
  const PostOfEvent({super.key});

  @override
  State<PostOfEvent> createState() => _PostOfEventState();
}

class _PostOfEventState extends State<PostOfEvent>
    with TickerProviderStateMixin {
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

    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 0),
      child: Column(
        children: [
          const NeumorphisimContainer(
            height: 180,
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              const Glass(
                height: 40,
              ),
              Row(
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
                      child: Text(isRegisted ? "Registered" : "Register",
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
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _like_controller.dispose();
    _save_controller.dispose();

    super.dispose();
  }
}
