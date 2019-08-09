import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalPage();
  }
}

class _PersonalPage extends State<PersonalPage> {
  final ValueNotifier<String> user = ValueNotifier<String>("");
  static const jumpPlugin = const MethodChannel('com.yichuizi.flutter_app/wechat');
  static const messageChannel2 = const BasicMessageChannel(
      'com.yichuizi.flutter_app/wechat_state', StandardMessageCodec());

  @override
  void initState() {
    super.initState();
    _receiveMessage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Future<String> userName = _get();
    userName.then((String userName) {
      user.value = userName;
    });
    return Container(
      width: 250,
      color: Colors.white,
      child: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, String value, Widget child) {
            return _build(value);
          },
          valueListenable: user,
        ),
      ),
    );
  }

  Widget _build(String user) {
    if (user != null) {
      return _login();
    } else {
      return _default();
    }
  }

  //默认未登陆
  Widget _default() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _jumpToNativeWechat();
          },
          shape: new CircleBorder(
              side: new BorderSide(
            style: BorderStyle.solid,
          )),
          child: Image.asset("assets/images/btn_login_wechat.png",
              width: 80, height: 80),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/loginByPhone');
          },
          shape: new CircleBorder(
              side: new BorderSide(
            style: BorderStyle.solid,
          )),
          child: Image.asset("assets/images/btn_login_phone.png",
              width: 80, height: 80),
        )
      ],
    );
  }

  //登陆状态
  Widget _login() {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: SizedBox(
              width: 110.0,
              height: 110.0,
              child: CircleAvatar(
                child: Text(
                  '果',
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.bookmark_border),
          title: Text('订单管理'),
        ),
        ListTile(
          leading: Icon(Icons.my_location),
          title: Text('我的WishR'),
          onTap: () {
            Navigator.pushNamed(context, '/loadmore', arguments: 1);
          },
        ),
        ListTile(
          leading: Icon(Icons.call_missed_outgoing),
          title: Text('退出登陆'),
          onTap: () {
            _logout();
            setState(() {});
          },
        )
      ],
    );
  }

  Future<Null> _jumpToNativeWechat() async {
    String result = await jumpPlugin.invokeMethod('oneAct');
    print(result);
  }

  void _receiveMessage() {
    messageChannel2.setMessageHandler((message){
      _save(message);
    });
  }

  _save(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", name);
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", null);
  }

  Future<String> _get() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("user");
    return userName;
  }
}
