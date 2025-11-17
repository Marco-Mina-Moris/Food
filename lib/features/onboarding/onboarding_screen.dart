import 'package:flutter/material.dart';
import 'package:food/core/common/animation/custom_animated_widget.dart';
import 'package:food/core/common/widget/custom_button.dart';
import 'package:food/core/constants/assets_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingData> onboardingList = dataOnboarding();
  int index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! image onboarding
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemBuilder:
                    (context, index) => CustomAnimatedWidget(
                      delay: index,
                      index: index,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            onboardingList[index].image,
                            width: 240,
                            height: 292,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                itemCount: onboardingList.length,
              ),
            ),
            SizedBox(height: 60),
            //! indicator onboarding
            //! title onboarding and description onboarding
            CustomAnimatedWidget(
              delay: (index + 1) * 100,
              index: index,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      onboardingList[index].title,
                      style: GoogleFonts.sen(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff32343E),
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      onboardingList[index].description,
                      style: GoogleFonts.sen(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff646982),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    SmoothPageIndicator(
                      controller: controller,
                      count: onboardingList.length,
                      axisDirection: Axis.horizontal,
                      effect: ExpandingDotsEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        dotColor: Color(0xffFFE1CE),
                        activeDotColor: Color(0xffFF7622),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 55),
            //! button next onboarding
            CustomButton(
              text: index < onboardingList.length - 1 ? "Next" : "Get Started",
              onPressed: () {
                if (index < onboardingList.length - 1) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, '/login');
                }
              }, 
            ),
            SizedBox(height: 16),
            Visibility(
              visible: index < onboardingList.length - 1,
              child: TextButton(
                onPressed: () {
                  controller.animateToPage(
                    onboardingList.length - 1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.sen(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff646982),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// DATA CLASS
class OnboardingData {
  final String image;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

// Dummy data
List<OnboardingData> dataOnboarding() {
  return [
    OnboardingData(
      image: AssetsConstants.onboarding1,
      title: 'All your favorites',
      description:
          'Get all your loved foods in one once place, you just place the order we do the rest',
    ),
    OnboardingData(
      image: AssetsConstants.onboarding2,
      title: 'Order from choosen chef',
      description:
          'Choose from our best chefs and enjoy restaurant quality meals at home',
    ),
    OnboardingData(
      image: AssetsConstants.onboarding3,
      title: 'Free delivery offers',
      description:
          'Enjoy fast and free delivery on your first orders with special offers',
    ),
  ];
}
