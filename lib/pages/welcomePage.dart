import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widget/skipDownTime.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage>
    implements OnSkipClickListener {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayedGoHomePage();
  }

  _delayedGoHomePage() {
    Future.delayed(new Duration(seconds: 5), () {
      _goHomePage();
    });
  }

  _goHomePage() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/index", (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Image.asset(
          'assets/images/splash.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        new Container(
          child: Align(
            alignment: Alignment.topRight,
            child: new Container(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0),
              child: new SkipDownTimeProgress(
                Colors.black,
                15.0,
                new Duration(seconds: 5),
                new Size(25.0, 25.0),
                skipText: "跳过",
                clickListener: this,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onSkipClick() {
    _goHomePage();
  }
}
