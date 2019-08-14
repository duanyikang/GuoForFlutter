import 'package:flutter/material.dart';

import 'DestinationNearWidget.dart';

class MddMiddleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MddMiddleWidget();
  }
}

class _MddMiddleWidget extends State<MddMiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Column(
                  children: <Widget>[
                    Image.network(
                        "http://img.mp.itc.cn/upload/20161028/53d01d07547741059fbf4208a25d81e8_th.jpeg",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        "攻略",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 50,
          ),
        ),
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      width: 90,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: new Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: new BorderRadius.circular((5.0)),
                      ),
                      child: Text(
                        "攻略",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.outlined_flag),
                  ],
                ),
              );
            },
            itemCount: 50,
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: new Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: new BorderRadius.circular((5.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('今日最佳攻略',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    new ClipRRect(
                        child: FadeInImage.assetNetwork(
                          height: 150,
                          placeholder: 'assets/images/iv_default_avatar.png',
                          image:
                              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565778893661&di=77f728a0a1a01a15b2cdc3ccd6873f91&imgtype=jpg&src=http%3A%2F%2Fimg0.imgtn.bdimg.com%2Fit%2Fu%3D1075255740%2C2110899155%26fm%3D214%26gp%3D0.jpg',
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ))
                  ],
                ),
              ),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width / 2 - 20,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: new Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: new BorderRadius.circular((5.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('最火旅行地',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('每日0点更新',
                        style: TextStyle(color: Colors.black26, fontSize: 18)),
                    Text('1.鸟巢',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('2王府井',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('3大望京',
                        style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('4大望京',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('5东湖渠',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        DestinationNearWidget()
      ],
    );
  }
}
