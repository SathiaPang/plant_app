import 'package:flutter/material.dart';
import 'package:plant_app/components/boardplant.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/login.dart';
import 'package:plant_app/ui/root_page.dart';

class OnBoardinScreen extends StatefulWidget {
  const OnBoardinScreen({super.key});
  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
              top: 20,
            ),
            child: InkWell(
              onTap: () => null,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Constants.primaryColor.withOpacity(0.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/images/plant-one.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'assets/images/plant-two.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              createPage(
                image: 'assets/images/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          //This is the Indicator builder
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => RootPage()));
                      //Not same as the video because it's dynamic, and can't assign to string
                    }
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

//Create the indicator decorations wideget here
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  //Create the Indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
