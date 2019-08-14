import 'package:flutter/material.dart';

import 'DestinationNearWidget.dart';

class MddMiddleWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MddMiddleWidget();
  }
}

class _MddMiddleWidget extends State<MddMiddleWidget> {

  var urls = [
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791760665&di=aeab583c38eb7d9299251870f55d77e0&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201805%2F13%2F20180513224039_tgfwu.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791760664&di=fbd38894fadcc448c10d70b1755e2358&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201702%2F22%2F20170222200954_zeJWu.thumb.700_0.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791793565&di=ca448882fee1c6386ad3defbd886a3b6&imgtype=jpg&src=http%3A%2F%2Fimg1.imgtn.bdimg.com%2Fit%2Fu%3D2579044471%2C4108191309%26fm%3D214%26gp%3D0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791760662&di=110ec8b9a232b45d9294e9c9d984e442&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201608%2F21%2F20160821230024_MyCYK.thumb.700_0.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791760662&di=7048bd1d2f279e7214f82cc884bf3798&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F31%2F20150331155006_kd5rr.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565791760661&di=5db40b91a96c81f1c12dbc95759ac068&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201307%2F03%2F20130703160220_2n8dL.thumb.700_0.jpeg"
  ];

  var title = ["攻略", "景点玩乐", "订酒店", "美食", "游记", "比赛"];
  var title2 = ["自由行", "跟团游", "定制旅行", "当地游", "周边游", "野游"];

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
                        urls[index],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Text(
                        title[index],
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 6,
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
                        title2[index],
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(Icons.outlined_flag),
                  ],
                ),
              );
            },
            itemCount: 6,
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2 - 20,
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2 - 20,
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
