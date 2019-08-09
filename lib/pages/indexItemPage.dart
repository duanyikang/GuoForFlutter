import 'package:flutter/material.dart';
import 'package:flutter_app/models/starShop.dart';
import 'package:flutter_app/widget/starItemWidget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IndexItemList extends StatefulWidget {
  final List data;
  final bool hasBanner;

  IndexItemList({Key key, this.data, this.hasBanner}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexItemListState();
  }
}

class _IndexItemListState extends State<IndexItemList>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[_banner(context, innerBoxIsScrolled)];
        },
        body: _gridView(),
      ),
      endDrawer: null,
    );
  }

  Widget _gridView() {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: 80,
        child: Padding(
            padding: new EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: widget.data.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 10.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 1.0 / 2.0),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return StarItemWidget(
                      starShopModel:
                          StarShopModel.fromJson(widget.data[index]));
                })));
  }

  Widget _swiper() {
    return Container(
        height: 200,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemWidth: 326,
          itemCount: 3,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Color(0x80000000),
                  activeColor: Color(0xff000000),
                  size: 10,
                  activeSize: 10,
                  space: 5),
              margin: EdgeInsets.all(17)),
          autoplay: true,
          duration: 150,
          controller: SwiperController(),
          scrollDirection: Axis.horizontal,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushNamed(context, '/dialogpage', arguments: null);
            } else {
              Navigator.pushNamed(context, '/stardetail', arguments: null);
            }
          },
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ClipRRect(
            child: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564997524&di=85a477c6ea32578b002ea55a16d75a3f&imgtype=jpg&er=1&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20170924%2F76cdd4a28b1545d98646fee678350d74.jpeg',
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )));
  }

  Widget _banner(BuildContext context, bool innerBoxIsScrolled) {
    if (widget.hasBanner) {
      return SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        child: SliverAppBar(
          forceElevated: innerBoxIsScrolled,
          bottom: PreferredSize(
              child: Container(), preferredSize: Size.fromHeight(145)),
          flexibleSpace: Column(
            children: <Widget>[
              _swiper(),
            ],
          ),
        ),
      );
    } else {
      return SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      );
    }
  }
}
