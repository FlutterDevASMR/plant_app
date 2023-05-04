import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:plant_store_app/screens/login_screen.dart';
import 'package:plant_store_app/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool getStarted = false;
  PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      if (controller.page != 2) {
        setState(() {
          getStarted = false;
        });
      } else {
        setState(() {
          getStarted = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> descriptions = [
      'We provide high quality plants just for you',
      'Your satisfaction is our number one priority',
      'Let\'s Shop Your Favorite Plant Now!',
    ];

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 30),
                  child: PageView.builder(
                    itemCount: descriptions.length,
                    controller: controller,
                    itemBuilder: (context, index) => OnboardingWidget(
                      imageUrl: 'images/onboarding_image_${index + 1}.png',
                      screeenHeight: height,
                      description: descriptions[index],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 7,
                        dotColor: Colors.grey.shade300,
                        activeDotColor: Colors.green,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 10),
                      child: SizedBox(
                        width: width,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.page != 2) {
                              controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            getStarted ? 'Get Started' : 'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
