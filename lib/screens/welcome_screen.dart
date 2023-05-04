import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:plant_store_app/screens/onboarding_screen.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OnboardingScreen(),
              ));
        },
        child: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/welcome_screen_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0),
                            Colors.white.withOpacity(0.5),
                            Colors.white,
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: DelayedWidget(
                        delayDuration: Duration(milliseconds: 200),
                        animationDuration: Duration(seconds: 1),
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        child: Column(
                          children: [
                            Text(
                              'Welcome to 👋',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Plant App',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.black,
                              highlightColor: Colors.grey,
                              child: Text(
                                lorem(paragraphs: 1, words: 15),
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      ),
                      padding: EdgeInsets.only(
                        bottom: height / 15,
                        right: width / 10,
                        left: width / 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
