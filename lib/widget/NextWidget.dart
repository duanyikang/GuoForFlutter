import 'package:flutter/material.dart';

class NextWidget extends AnimatedWidget {
  Animation<double> animation;
  @required
  VoidCallback onPress;

  NextWidget(Animation<double> animation, VoidCallback onPress)
      : super(listenable: animation) {
    this.animation = animation;
    this.onPress = onPress;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPress,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 130,
            ),
            Positioned(
                top: animation.value,
                child: Image.asset(
                  "assets/images/iv_default_avatar.png",
                  fit: BoxFit.cover,
                  height: 50,
                )),
            Text(
              '下一步',
              style: TextStyle(
                  color: animation.status == AnimationStatus.dismissed
                      ? Colors.grey
                      : Colors.red),
            ),
          ],
        ));
  }
}
