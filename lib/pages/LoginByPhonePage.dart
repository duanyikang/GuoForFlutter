import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/utils/EventBus.dart';
import 'package:flutter_app/widget/NextWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginByPhonePage extends StatefulWidget {
  String number = '';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginByPhonePage();
  }
}

class _LoginByPhonePage extends State<LoginByPhonePage>
    with SingleTickerProviderStateMixin {
  bool _isAgree = true;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = new Tween(begin: 0.0, end: 60.0).animate(new CurvedAnimation(
      parent: controller,
      curve: new Interval(
        0.550,
        0.999,
        curve: Curves.decelerate,
      ),
    ));

    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        _playAnimation();
      }
    });
  }

  Future<Null> _playAnimation() async {
    try {
      await controller.forward();
      await controller.reverse();
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.value.text.length == 11) {
        _playAnimation();
      } else {
        controller.stop();
      }
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: _buildBody(_controller),
      ),
    );
  }

  Widget _buildBody(TextEditingController _controller) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('手机号登陆', style: TextStyle(fontSize: 50)),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
            child: Text('欢迎来到果果运动社区', style: TextStyle(fontSize: 20)),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )))),
          Row(
            children: <Widget>[
              Checkbox(
                value: _isAgree,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _isAgree = value;
                  });
                },
              ),
              Text(
                '你已经同意了我的各种要求侬晓得哇',
                style: TextStyle(color: _isAgree ? Colors.red : Colors.grey),
              )
            ],
          ),
          Center(child: Builder(builder: (BuildContext context) {
            return NextWidget(animation, () {
              if (_controller.text.length == 11) {
                _save();
                Navigator.pop(context);
              } else {
                Scaffold.of(context)
                    .showSnackBar(new SnackBar(content: Text("大哥你的手机号有点问题")));
              }
            });
          }))
        ],
      ),
    );
  }

  _save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", "6666666666");
    bus.emit("login");
  }
}
