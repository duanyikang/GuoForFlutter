
import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/GeneralSliverDelegate.dart';
import 'package:flutter_app/delegate/OffsetNotifierData.dart';
import 'package:flutter_app/delegate/SearchWidgetDelegate.dart';
import 'package:flutter_app/models/starShop.dart';
import 'package:flutter_app/utils/api.dart' as api;
import 'package:flutter_app/widget/destinationSearchWidget.dart';
import 'package:flutter_app/widget/starItemWidget.dart';

class StarDetailPage extends StatefulWidget {
  final StarShopModel starShopModel;

  const StarDetailPage({Key key, this.starShopModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StarDetailPage();
  }
}

class _StarDetailPage extends State<StarDetailPage> {
  List<dynamic> videolist = [];

  OffsetNoitiferData vd = OffsetNoitiferData(0);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true, //是否固定在顶部
            floating: false,
            delegate: SearchWidgetDelegate(
                minHeight: 100, //收起的高度
                maxHeight: 150,
                vd: vd, //展开的最大高度
                child: DestinationSearchWidget(
                  data: vd,
                )),
          ),
          SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: GeneralSliverDelegate(
                minHeight: 150, //收起的高度
                maxHeight: 150, //展开的最大高度
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Container(
                        width: 150,
                        height: 150,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(8),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[new Text(index.toString())],
                        ),
                      );
                    },
                    itemCount: 50,
                  ),
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new Container(
                  width: 100,
                  height: 50,
                  color: Colors.deepOrange,
                  margin: EdgeInsets.all(8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[new Text(index.toString())],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: GeneralSliverDelegate(
                minHeight: 80, //收起的高度
                maxHeight: 80, //展开的最大高度
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return new Container(
                        width: 80,
                        height: 80,
                        color: Colors.greenAccent,
                        margin: EdgeInsets.all(8),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[new Text(index.toString())],
                        ),
                      );
                    },
                    itemCount: 50,
                  ),
                )),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //纵轴间距
                  mainAxisSpacing: 10.0,
                  //横轴间距
                  crossAxisSpacing: 10.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.0 / 2.0),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    child: StarItemWidget(
                        starShopModel:
                            StarShopModel.fromJson(videolist[index])),
                  );
                },
                childCount: videolist.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void init() async {
    List temp = await api.getVideoDetail('1');
    setState(() {
      videolist = temp;
    });
  }
}
