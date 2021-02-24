import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lateck/screens/login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10,
      width: isActive ? 10.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(color: Colors.blue[900]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => Navigator.of(context)
                        .popAndPushNamed(LoginScreen.routeName),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'LATECH',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/img/Group 1.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'Let\'s Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/img/illustration-2.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'Alot Of Exclusives',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/img/illustration.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'The Best Teck Market',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              height: 80,
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: FlatButton(
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Colors.blue[900], fontSize: 24),
                                  ),
                                  onPressed: () {},
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Center(
                              child: FlatButton(
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                onPressed: () => Navigator.of(context)
                                    .popAndPushNamed(LoginScreen.routeName),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
