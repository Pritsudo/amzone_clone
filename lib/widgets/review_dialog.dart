import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ReviewDialog extends StatelessWidget {
  const ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      title: Text(
        'Type Review',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?

      submitButtonText: 'Send',
      commentHint: 'Type here',

      onSubmitted: (RatingDialogResponse res) {
        
      },
    );
  }
}
