import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class PartyProvider with ChangeNotifier {
  final ConfettiController _partyController = ConfettiController();

  ConfettiController get partyController => _partyController;

  void startParty() {
    partyStart();
    partyStop();
    notifyListeners();
  }

  void partyStart() {
    _partyController.play();
  }

  void partyStop() async {
    await Future.delayed(const Duration(seconds: 3), () {
      _partyController.stop();
    });
  }

  void partyDispose() {
    _partyController.dispose();
  }
}
