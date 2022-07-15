import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isLoading;
  final VoidCallback onPressed;

  const CustomMainButton({
    Key? key,
    required this.child,
    required this.color,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: 
    // Aspect ratio is used when we need complete widget in fixed size without any change in that.
             AspectRatio(
              aspectRatio: 1/1,
              child: Center(
                  child: CircularProgressIndicator(),
                ),
            ),
          )
          : child,
      style: ElevatedButton.styleFrom(
          primary: color, fixedSize: Size(screenSize.width * 0.5, 40)),
    );
  }
}
