import 'package:flutter/material.dart';
import 'package:mealsapp/commonWidgets/custom_alert.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> actions;

  CustomAlertDialog({
    required this.title,
    required this.message,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlert(
              title: title,
              message: message,
              actions: actions,
            );
          },
        );
      },
      child: Text('Show Dialog'),
    );
  }
}

// CustomAlertDialog(
//   title: 'Add favourite meal',
//   message: '${meal.title}',
//   actions: [
//     TextButton(
//       child: Text('OK'),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     ),
//   ],
// )