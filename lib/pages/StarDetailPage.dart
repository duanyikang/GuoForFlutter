import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/GeneralSliverDelegate.dart';
import 'package:flutter_app/delegate/OffsetNotifierData.dart';
import 'package:flutter_app/delegate/SearchWidgetDelegate.dart';
import 'package:flutter_app/models/HeadBean.dart';
import 'package:flutter_app/models/starShop.dart';
import 'package:flutter_app/utils/api.dart' as api;
import 'package:flutter_app/widget/DestinationMiddleWidget.dart';
import 'package:flutter_app/widget/DestinationSearchWidget.dart';
import 'package:flutter_app/widget/StarItemWidget.dart';

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
  List<String> bottomTags = [];
  HeadBean headBean;
  int currentPosition = 0;

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
          //搜索
          SliverPersistentHeader(
            pinned: true, //是否固定在顶部
            floating: false,
            delegate: SearchWidgetDelegate(
                minHeight: 100, //收起的高度
                maxHeight: 130,
                vd: vd, //展开的最大高度
                child: DestinationSearchWidget(
                  data: vd,
                  headBean: headBean,
                )),
          ),
          //中间模块
          SliverPersistentHeader(
            pinned: false,
            floating: false,
            delegate: GeneralSliverDelegate(
                minHeight: 1000, //收起的高度
                maxHeight: 1000, //展开的最大高度
                child: Container(
                    alignment: Alignment.centerLeft, child: MddMiddleWidget())),
          ),
          //底部吸顶模块
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: GeneralSliverDelegate(
                minHeight: 40, //收起的高度
                maxHeight: 40, //展开的最大高度
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            _onClickTag(index);
                          },
                          child: Container(
                            height: 40,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: new Border.all(
                                    color: Colors.grey, width: 0.5),
                                borderRadius: new BorderRadius.circular((5.0)),
                                color: index == currentPosition
                                    ? Colors.yellow
                                    : Colors.transparent),
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[new Text(bottomTags[index])],
                            ),
                          ));
                    },
                    itemCount: bottomTags == null ? 0 : bottomTags.length,
                  ),
                )),
          ),
          //底部内容区域
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
                childCount: videolist == null ? 0 : videolist.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void init() async {
    List temp = await api.getVideoDetail('1');
    List bottomTemp = await api.getBottomTags('北京');
    Map headBeanTemp = await api.getHeadInfo('北京');
    setState(() {
      headBean = HeadBean.fromJson(headBeanTemp);
      videolist = temp;
      bottomTags = bottomTemp.cast<String>();
    });
  }

  _onClickTag(int index) async {
    currentPosition = index;
    List temp = await api.getVideoDetail('1');
    setState(() {
      videolist = temp;
    });
  }
}
