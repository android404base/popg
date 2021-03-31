import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  final String failureMessage;
  const FailureWidget({
    required this.failureMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 200,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.warning,
              size: 50,
              color: Colors.redAccent.shade700,
            ),
            SizedBox(
              height: 20,
            ),
            Text(failureMessage),
          ],
        ),
      ),
    );
  }
}
