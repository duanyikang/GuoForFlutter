import 'package:flutter/material.dart';

class DestinationNearWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DestinationNearWidget();
  }
}

class _DestinationNearWidget extends State<DestinationNearWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this)
      ..repeat();
    animation = new Tween(begin: 0.0, end: 1.2).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });

    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.dismissed) {
        Future.delayed(new Duration(seconds: 2), () {
          _playAnimation();
        });
      }
    });
    _playAnimation();
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
    return Row(
      children: <Widget>[
        Container(
            height: 110,
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 110,
                  width: 110,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          width: calculation(animation.value, 1),
                          height: calculation(animation.value, 1),
                          placeholder: 'assets/images/iv_default_avatar.png',
                          image:
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565782492333&di=a1cf4fa9ed5aa7ef7d3869484955b8f5&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F15%2F20160815195028_UERAa.jpeg',
                          fit: BoxFit.cover,
                        )),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          width: calculation(animation.value, 2),
                          height: calculation(animation.value, 2),
                          placeholder: 'assets/images/iv_default_avatar.png',
                          image:
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565782492334&di=d1792c6e08bccdafde956ae9925bc656&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F14%2F20150314210250_MXuZh.jpeg',
                          fit: BoxFit.cover,
                        )),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                          width: calculation(animation.value, 3),
                          height: calculation(animation.value, 3),
                          placeholder: 'assets/images/iv_default_avatar.png',
                          image:
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566377211&di=a49a21c0685fbfb14904c700802c06d2&imgtype=jpg&er=1&src=http%3A%2F%2Fgss0.baidu.com%2F94o3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2Ff3d3572c11dfa9ec6274225c62d0f703918fc127.jpg',
                          fit: BoxFit.cover,
                        )),
                      )
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(20, 35, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '932人也在附近',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text('三分钟前发过笔记')
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: FlatButton(
                    onPressed: () {},
                    shape: StadiumBorder(),
                    color: Colors.grey,
                    child: Text(
                      '去看看',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  double calculation(double value, int index) {
    if (value >= 0.0 && value < 0.4) {
      switch (index) {
        case 1:
          return (0.4 - value) * 50 + 10;
        case 2:
          return (0.4 + value) * 50 + 10;
        case 3:
          return (0.8 + value) * 50 + 10;
      }
    } else if (value >= 0.4 && value < 0.8) {
      switch (index) {
        case 1:
          return (value) * 50 + 10;
        case 2:
          return (value + 0.8) * 50 + 10;
        case 3:
          return (value - 0.4) * 50 + 10;
      }
    } else {
      switch (index) {
        case 1:
          return (value) * 50 + 10;
        case 2:
          return (value - 0.8) * 50 + 10;
        case 3:
          return (value - 0.4) * 50 + 10;
      }
    }
    return 0.0;
  }
}
