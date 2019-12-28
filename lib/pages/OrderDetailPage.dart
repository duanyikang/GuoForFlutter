import 'package:flutter/material.dart';
import 'package:flutter_app/models/OrderModel.dart';
import 'package:flutter_app/widget/MySeparator.dart';

//订单详情
class OrderDetailPage extends StatefulWidget {
  final OrderModel orderBean;

  const OrderDetailPage({Key key, this.orderBean}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _OrderDetailPage();
  }
}

class _OrderDetailPage extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              leading: Text("<"),
              backgroundColor: Color(0xFF1A1A23),
              pinned: true,
              elevation: 0,
              title: Text("订单详情",
                  style: TextStyle(fontSize: 18, color: Color(0xFFFFFFFF))),
              expandedHeight: 154,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Text('待支付',
                        style:
                            TextStyle(fontSize: 22, color: Color(0xFFFFFFFF))),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Color(0xFF2E2E51), Color(0xFF42346A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
              ))),
          SliverFillRemaining(
              child: Container(
            decoration: BoxDecoration(color: Color(0xFF1A1A23)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //地址第一部分
                Row(
                  children: <Widget>[
                    Padding(
                      child: Image.asset(
                        "assets/images/iv_address_start.png",
                        height: 26,
                        width: 26,
                      ),
                      padding: EdgeInsets.fromLTRB(18, 15, 0, 0),
                    ),
                    Padding(
                      child: Text(
                        "石亚鹏",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xB3FFFFFF)),
                      ),
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    ),
                    Padding(
                      child: Text(
                        "+86-1868686862",
                        style:
                            TextStyle(fontSize: 13, color: Color(0x4DFFFFFF)),
                      ),
                      padding: EdgeInsets.fromLTRB(12, 15, 0, 0),
                    )
                  ],
                ),

                //地址第二部分
                Padding(
                  child: Text(
                    "北京市朝阳区来广营镇融创动力文化产业园A座左侧小路尽头A119",
                    style: TextStyle(fontSize: 13, color: Color(0x80FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(54, 10, 18, 0),
                ),

                //虚线
                Padding(
                  child: MySeparator(color: Color(0x1AFFFFFF)),
                  padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                ),

                //店铺名称
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    child: Text("店铺名称",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xB3FFFFFF))),
                    padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                  ),
                ),

                //虚线
                Padding(
                  child: MySeparator(color: Color(0x1AFFFFFF)),
                  padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                ),

                //圆角图片以横流
                Row(
                  children: <Widget>[
                    Padding(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: FadeInImage.assetNetwork(
                            placeholder: "images/ic_device_image_default.png",
                            image:
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577554100502&di=90680448c80584b9308997df6b5ff53d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F52a313471fb7c550c8955982.jpg",
                            fit: BoxFit.cover,
                            width: 70,
                            height: 70,
                          )),
                      padding: EdgeInsets.fromLTRB(18, 33, 0, 0),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          child: Text(
                            "商品名称",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 15),
                          ),
                          padding: EdgeInsets.fromLTRB(12, 29, 0, 0),
                        ),
                        Padding(
                          child: Text(
                            "送给哈里波波",
                            style: TextStyle(
                                color: Color(0x80FFFFFF), fontSize: 15),
                          ),
                          padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
                        ),
                        Padding(
                          child: Text(
                            "价格 ¥ 2000",
                            style: TextStyle(
                                color: Color(0xB3FFFFFF), fontSize: 15),
                          ),
                          padding: EdgeInsets.fromLTRB(12, 8, 0, 0),
                        )
                      ],
                    )
                  ],
                ),

                //虚线
                Padding(
                  child: MySeparator(color: Color(0x1AFFFFFF)),
                  padding: EdgeInsets.fromLTRB(18, 14, 18, 0),
                ),

                //视频文案
                Padding(
                  child: Text(
                    "视频文案",
                    style: TextStyle(fontSize: 15, color: Color(0xB3FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                ),

                Padding(
                  child: Text(
                    "祝 李北斗 生日快乐~希望你好运连连~抽奖就中奖！限量都能抢到！早日暴富！",
                    style: TextStyle(fontSize: 13, color: Color(0x80FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(18, 13, 18, 0),
                ),

                //视频备注
                Padding(
                  child: Text(
                    "备注",
                    style: TextStyle(fontSize: 15, color: Color(0xB3FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
                ),

                Padding(
                  child: Text(
                    "我快过生日了，可以唱首歌为我庆祝一",
                    style: TextStyle(fontSize: 13, color: Color(0x80FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(18, 13, 0, 0),
                ),

                //上传的图片
                Padding(
                  child: Text(
                    "上传的图片",
                    style: TextStyle(fontSize: 15, color: Color(0xB3FFFFFF)),
                  ),
                  padding: EdgeInsets.fromLTRB(18, 10, 18, 0),
                ),

                Padding(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: FadeInImage.assetNetwork(
                              placeholder: "images/ic_device_image_default.png",
                              image:
                                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577554100502&di=90680448c80584b9308997df6b5ff53d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F52a313471fb7c550c8955982.jpg",
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            )),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      Padding(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: FadeInImage.assetNetwork(
                              placeholder: "images/ic_device_image_default.png",
                              image:
                                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577554100502&di=90680448c80584b9308997df6b5ff53d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F52a313471fb7c550c8955982.jpg",
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            )),
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      ),
                      Padding(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: FadeInImage.assetNetwork(
                              placeholder: "images/ic_device_image_default.png",
                              image:
                                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577554100502&di=90680448c80584b9308997df6b5ff53d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F52a313471fb7c550c8955982.jpg",
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            )),
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      ),
                      Padding(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: FadeInImage.assetNetwork(
                              placeholder: "images/ic_device_image_default.png",
                              image:
                                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1577554100502&di=90680448c80584b9308997df6b5ff53d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2F52a313471fb7c550c8955982.jpg",
                              fit: BoxFit.cover,
                              width: 70,
                              height: 70,
                            )),
                        padding: EdgeInsets.fromLTRB(8,0, 0, 0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(18, 8, 18, 0),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
