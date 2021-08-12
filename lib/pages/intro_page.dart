import 'package:flutter/material.dart';

import '../Strings.dart';
import 'home_page.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'intro_page';

  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          if (currentIndex == 2)
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.deepOrange, fontSize: 30),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                content,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isAvtive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 6,
      width: isAvtive ? 25 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

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
