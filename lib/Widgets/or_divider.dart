import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: Colors.deepPurple,
          thickness: 3,
        )),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "OR",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Expanded(
            child: Divider(
          color: Colors.deepPurple,
          thickness: 3,
        )),
      ]),
    );
  }
}
