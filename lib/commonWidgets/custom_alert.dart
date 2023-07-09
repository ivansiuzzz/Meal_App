import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  CustomAlert({
    required this.title,
    required this.message,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      titlePadding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 24),
      actionsPadding: EdgeInsets.fromLTRB(8, 0, 8, 8),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      actions: actions,
    );
  }
}
