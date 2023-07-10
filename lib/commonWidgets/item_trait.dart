import 'package:flutter/material.dart';

class ItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  ItemTrait({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
