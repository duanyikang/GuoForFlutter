import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DalogPage();
  }
}

class _DalogPage extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    var title = Container(
      alignment: AlignmentDirectional.center,
      child: Text(
        "Dialog Unit",
        style: TextStyle(fontSize: 30),
      ),
    );

    Map<String, Function> buttons = {
      "对话框SimpleDialog": _showSimpleDialog,
      "对话框AlertDialog": _showAlertDialog,
      "对话框CupertinoAlertDialog": _showCupertinoAlertDialog,
      "对话框显示自己": _showWidgetDialog,
      "对话框显示StatefulWidget": _showStatefulWidgetDialog,
      "Scaffold": _showScaffold,
      "BottomSheet": _showBottomSheet,
      "DatePicker": _showDatePicker,
      "TimePicker": _showTimePicker,
      "CupertinoPicker": _showCupertinoPicker,
      "CupertinoDatePicker": _showCupertinoDatePicker,
      "CupertinoTimerPicker": _showCupertinoTimerPicker,
    };

    var btns = buttons.keys.toList().map((str) {
      //构建按钮组件列表
      return RaisedButton(
        onPressed: () {
          buttons[str](context);
        },
        child: Text(str),
      );
    }).toList();

    var result = Column(
      children: <Widget>[
        title,
        Column(
          children: btns,
        )
      ],
    );
    return result;
  }

  //对话框
  _showSimpleDialog(BuildContext context) {
    var strs = [
      '云深不知处内亥时息,卯时起',
      "云深不知处内不可挑食留剩,不可境内杀生",
      "云深不知处内不可私自斗殴,不可淫乱",
      "云深不知处禁止魏无羡入内,不可吹笛"
    ];

    var title = Row(
      //标题
      children: <Widget>[
        Image.asset(
          "assets/images/iv_default_avatar.png",
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        new Text("蓝氏家规")
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: title,
            children: strs.map((str) {
              return SimpleDialogOption(
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.turned_in_not,
                      color: Colors.blue,
                    ),
                    Text(str)
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop(str);
                  print(str);
                },
              );
            }).toList(),
          );
        });
  }

  //Android风格对话框
  _showAlertDialog(BuildContext context) {
    var title = Row(
      //标题
      children: <Widget>[
        Image.asset(
          "images/icon_wwx.png",
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        new Text("表白")
      ],
    );
    var content = Row(
      //内容
      children: <Widget>[
        Text("我💖你，你是我的"),
        Image.asset(
          "images/icon_ylm.png",
          width: 30,
          height: 30,
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) => //构造器
            AlertDialog(title: title, content: content, actions: <Widget>[
              FlatButton(
                child: Text("不要闹"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("走开"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]));
  }

  //ios风格对话框
  _showCupertinoAlertDialog(BuildContext context) {
    var title = Row(
      //标题
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "images/icon_wwx.png",
          width: 30,
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        new Text("表白")
      ],
    );
    var content = Row(
      children: <Widget>[
        Text(
          "我💖你，你是我的",
          style: TextStyle(fontSize: 20),
        ),
        Image.asset(
          "images/icon_ylm.png",
          width: 40,
          height: 40,
        )
      ],
    );
    var dialog = CupertinoAlertDialog(
      content: content,
      title: title,
      actions: <Widget>[
        CupertinoButton(
          child: Text("不要闹"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoButton(
          child: Text("走开"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  _showWidgetDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return this.widget;
        });
  }

  _showStatefulWidgetDialog(BuildContext context) {
    var progress = 0.0;
    StateSetter stateSetter;

    Timer.periodic(Duration(milliseconds: 100), (timer) {
      //计时器模拟进度增加
      progress += 0.1;
      if (stateSetter != null) {
        stateSetter(() {});
      }
      if (progress >= 1) {
        timer.cancel();
        stateSetter = null;
        Navigator.of(context).pop();
      }
    });

    var statefulBuilder = StatefulBuilder(
      builder: (ctx, state) {
        stateSetter = state;
        return Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: Card(
              elevation: 24.0,
              color: Colors.blue.withAlpha(240),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    value: progress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Loading...",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "done ${((progress - 0.1) * 100).toStringAsFixed(1)}%",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    showDialog(context: context, builder: (ctx) => statefulBuilder);
  }

  _showScaffold(BuildContext context) {
    var snackBar = SnackBar(
        backgroundColor: Color(0xffFB6431), //颜色
        content: Text('Hello!'), //内容
        duration: Duration(seconds: 3), //持续时间
        action: SnackBarAction(
            label: '确定',
            onPressed: () {
              print("Flutter之旅");
            }));
    Scaffold.of(context).showSnackBar(snackBar); //这样就行了
  }

  bool _showing = false;

  _showBottomSheet(BuildContext context) {
    var bottomSheet = BottomSheet(
        onClosing: () {},
        builder: (context) => (Container(
              color: Color(0xdde3fbf6),
              height: 150,
              child: Center(
                child: Image.asset("assets/images/iv_default_avatar.png"),
              ),
            )));
    if (_showing) {
      Navigator.of(context).pop();
    } else {
      Scaffold.of(context).showBottomSheet(bottomSheet.builder); //这样就行了
    }
    _showing = !_showing;
  }

  _showDatePicker(BuildContext cxt) {
    showDatePicker(
      context: cxt,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((data) {
      print(data);
    });
  }

  _showTimePicker(BuildContext cxt) {
    showTimePicker(
      context: cxt,
      initialTime: TimeOfDay(hour: 11, minute: 45),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    ).then((data) {
      print(data);
    });
  }

  _showCupertinoPicker(BuildContext context) {
    var names = ['魏祖', '蓝二', '江姐', '江舅', '瑶妹'];
    final picker = CupertinoPicker(
        itemExtent: 40,
        onSelectedItemChanged: (position) {
          print('The position is ${names[position]}');
        },
        children: names.map((e) {
          return Text(e);
        }).toList());
    showCupertinoModalPopup(
        context: context,
        builder: (cxt) {
          return Container(
            height: 200,
            child: picker,
          );
        });
  }

  _showCupertinoDatePicker(BuildContext context) {
    final picker = CupertinoDatePicker(
      onDateTimeChanged: (date) {
        print("当前日期、时间 ${date.toString()}");
      },
      initialDateTime: DateTime(1994),
    );
    showCupertinoModalPopup(
        context: context,
        builder: (cxt) {
          return Container(
            height: 200,
            child: picker,
          );
        });
  }

  _showCupertinoTimerPicker(BuildContext cxt) {
    final picker = CupertinoTimerPicker(onTimerDurationChanged: (duration) {
      print('当前时间 $duration');
    });
    showCupertinoModalPopup(
        context: cxt,
        builder: (cxt) {
          return Material(
            child: Container(
              height: 200,
              child: picker,
            ),
          );
        });
  }
}
