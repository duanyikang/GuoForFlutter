import 'dart:async';

import 'package:flutter/material.dart';

class DestinationMiddlePageWidget extends StatefulWidget {
  final OnTapViewPagerItem onTap;

  final List<String> arr = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767598&di=b5e701f2b6e1cf95eaff25467b499cb6&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180320%2F05cc7af15ddc47069bd445033cdc6e84.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767594&di=9ca41bf75586ffadac6c170444d9c21a&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20161211%2Fde1515bb32b24cf58c72e7d8f6637f35_th.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767593&di=ef73970bae6894f2459e541a78badef8&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201207%2F15%2F20120715001651_XuhwE.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767590&di=300430af650f77adf9abeef910449ba3&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F9vo3dSag_xI4khGko9WTAnF6hhy%2Flvpics%2Fh%3D800%2Fsign%3D8653a6ae791ed21b66c923e59d6fddae%2F4b90f603738da97738d5b177b451f8198718e3f7.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849831608&di=212aaa9b6e6576c6a1fefa67269bda34&imgtype=0&src=http%3A%2F%2Fupload.17u.net%2Fuploadpicbase%2Fimage%2F201306180427130753.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849831606&di=e0caecea2336a02961e01009769a3bd6&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120627%2F387472_170953463126_2.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767598&di=b5e701f2b6e1cf95eaff25467b499cb6&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180320%2F05cc7af15ddc47069bd445033cdc6e84.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767594&di=9ca41bf75586ffadac6c170444d9c21a&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20161211%2Fde1515bb32b24cf58c72e7d8f6637f35_th.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767593&di=ef73970bae6894f2459e541a78badef8&imgtype=0&src=http%3A%2F%2Fimg5q.duitang.com%2Fuploads%2Fitem%2F201207%2F15%2F20120715001651_XuhwE.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849767590&di=300430af650f77adf9abeef910449ba3&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F9vo3dSag_xI4khGko9WTAnF6hhy%2Flvpics%2Fh%3D800%2Fsign%3D8653a6ae791ed21b66c923e59d6fddae%2F4b90f603738da97738d5b177b451f8198718e3f7.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849831608&di=212aaa9b6e6576c6a1fefa67269bda34&imgtype=0&src=http%3A%2F%2Fupload.17u.net%2Fuploadpicbase%2Fimage%2F201306180427130753.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565849831606&di=e0caecea2336a02961e01009769a3bd6&imgtype=0&src=http%3A%2F%2Fpic22.nipic.com%2F20120627%2F387472_170953463126_2.jpg'
  ];

  DestinationMiddlePageWidget(this.onTap, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DestinationMiddlePageWidget();
  }
}

class _DestinationMiddlePageWidget extends State<DestinationMiddlePageWidget> {
  int virtualIndex = 0;
  int realIndex = 1;

  PageController controller;
  Timer timer;
  PageController _transController = new PageController();
  var _currentPageValue = 0.0;

  PageController _entryController = new PageController();
  var _entryPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(initialPage: realIndex);
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //实现自动滚动
      controller.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });

    _transController.addListener(() {
      setState(() {
        _currentPageValue = _transController.page;
      });
    });

    _entryController.addListener(() {
      setState(() {
        _entryPageValue = _entryController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        //默认构造函数的ViewPager
//        Container(
//          height: 200,
//          child: PageView(
//            controller: controller,
//            onPageChanged: _onPageChanged,
//            children: _buildItems(), //滚动的view
//          ),
//        ),
//        Container(height: 30, child: _buildIndicator()), //滚动的小点
        //使用PageView.builder
        //添加transformation
        Container(
          height: 500,
          child: PageView.builder(
              controller: _transController,
              itemCount: widget.arr.length,
              physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (BuildContext context, int index) {
                if (index == _currentPageValue.floor()) {
                  //将要出去的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(_currentPageValue - index),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: new ClipRRect(
                            child: Image.network(
                              widget.arr[index],
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ))),
                  );
                } else if (index == _currentPageValue.floor() + 1) {
                  //将要进来的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateZ(_currentPageValue - index),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8,
                        ),
                        child: new ClipRRect(
                            child: Image.network(
                              widget.arr[index],
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ))),
                  );
                } else {
                  //其他，不在屏幕显示的item
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: Image.network(
                      widget.arr[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
        ),
//        Container(
//          height: 200,
//          child: PageView.custom(
//            controller: _entryController,
//            childrenDelegate:
//                SliverChildBuilderDelegate((BuildContext context, int index) {
//              if (index == _entryPageValue.floor()) {
//                //出去的item
//                return Transform(
//                    transform: Matrix4.identity()
//                      ..setEntry(3, 2, 0.004)
//                      ..rotateY(_entryPageValue - index)
//                      ..rotateZ(_entryPageValue - index),
//                    child: Image.network(
//                      widget.arr[index],
//                      fit: BoxFit.fill,
//                    ));
//              } else if (index == _entryPageValue.floor() + 1) {
//                //进来的item
//                return Transform(
//                    transform: Matrix4.identity()
//                      ..setEntry(3, 2, 0.004)
//                      ..rotateY(_entryPageValue - index)
//                      ..rotateZ(_entryPageValue - index),
//                    child: Image.network(
//                      widget.arr[index],
//                      fit: BoxFit.fill,
//                    ));
//              } else {
//                return Image.network(
//                  widget.arr[index],
//                  fit: BoxFit.fill,
//                );
//              }
//            }, childCount: widget.arr.length),
//          ),
//        ),
      ],
    );
  }

  List<Widget> _buildItems() {
    //轮播图
    List<Widget> items = [];
    if (widget.arr.length > 0) {
      //头部添加一个尾部item，模拟循环
      items.add(_buildItem(widget.arr[widget.arr.length - 1]));
      //添加正常item
      items.addAll(widget.arr
          .map((imgUrl) => _buildItem(imgUrl))
          .toList(growable: false));
      //尾部
      items.add(_buildItem(widget.arr[0]));
    }
    return items;
  }

  Widget _buildItem(String imgUrl) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap(imgUrl);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  //创建轮播图点
  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.arr.length; i++) {
      indicators.add(Container(
        //当有装饰组件作为子组件的时候，是一个装饰容器
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
        decoration: BoxDecoration(
            //装饰组件，对装饰容器进行装饰用，添加颜色、图片、边框、圆角、阴影、渐变、背景混合、形状
            shape: BoxShape.circle,
            color: i == virtualIndex ? Colors.white : Colors.grey),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = widget.arr.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
    setState(() {});
  }
}

typedef void OnTapViewPagerItem(String data);
