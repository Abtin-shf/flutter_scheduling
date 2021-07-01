import 'package:flutter/material.dart';

class StudentUnitSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 300,
            color: Theme.of(context).errorColor,
          ),
          Text(
            'This Page Has Not Yet Been\n            Implemented!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
