import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.screeenHeight,
  });

  String imageUrl;
  String description;
  double screeenHeight;

  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
      delayDuration: Duration(milliseconds: 200),
      animationDuration: Duration(seconds: 1),
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: screeenHeight / 30),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
