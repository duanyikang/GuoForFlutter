import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/VideoChangeNotifier.dart';
import 'package:flutter_app/models/video.dart';
import 'package:flutter_app/widget/videoplay/BottomDragWidget.dart';
import 'package:flutter_app/widget/videoplay/VideoPlayWidget.dart';

class VideoPlayPage extends StatefulWidget {
  final List<VideoModel> arr = [
    new VideoModel(
        "1",
        "甄嬛",
        "钮祜禄大小姐",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg"),
    new VideoModel(
        "2",
        "年世兰",
        "年羹尧妹妹，华妃",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg"),
    new VideoModel(
        "3",
        "安陵容",
        "安小鸟，就会唱歌垃圾",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg"),
    new VideoModel(
        "4",
        "果郡王",
        "甄嬛最爱的男人，没茅台",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg"),
    new VideoModel(
        "5",
        "沈眉庄",
        "甄嬛的眉姐姐，挺惨的",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg"),
    new VideoModel(
        "6",
        "皇上",
        "唉妈呀！绿的不要不要的",
        "http://n.sinaimg.cn/sinacn11/246/w646h400/20180321/445a-fyskeue0737376.jpg",
        "http://imgsrc.baidu.com/forum/pic/item/314e251f95cad1c84dbe069c7f3e6709c93d5100.jpg"),
    new VideoModel(
        "1",
        "甄嬛",
        "钮祜禄大小姐",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg"),
    new VideoModel(
        "2",
        "年世兰",
        "年羹尧妹妹，华妃",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg"),
    new VideoModel(
        "3",
        "安陵容",
        "安小鸟，就会唱歌垃圾",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg"),
    new VideoModel(
        "4",
        "果郡王",
        "甄嬛最爱的男人，没茅台",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg"),
    new VideoModel(
        "5",
        "沈眉庄",
        "甄嬛的眉姐姐，挺惨的",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg"),
    new VideoModel(
        "6",
        "皇上",
        "唉妈呀！绿的不要不要的",
        "http://n.sinaimg.cn/sinacn11/246/w646h400/20180321/445a-fyskeue0737376.jpg",
        "http://imgsrc.baidu.com/forum/pic/item/314e251f95cad1c84dbe069c7f3e6709c93d5100.jpg"),
    new VideoModel(
        "1",
        "甄嬛",
        "钮祜禄大小姐",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg"),
    new VideoModel(
        "2",
        "年世兰",
        "年羹尧妹妹，华妃",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg"),
    new VideoModel(
        "3",
        "安陵容",
        "安小鸟，就会唱歌垃圾",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg"),
    new VideoModel(
        "4",
        "果郡王",
        "甄嬛最爱的男人，没茅台",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg"),
    new VideoModel(
        "5",
        "沈眉庄",
        "甄嬛的眉姐姐，挺惨的",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg"),
    new VideoModel(
        "6",
        "皇上",
        "唉妈呀！绿的不要不要的",
        "http://n.sinaimg.cn/sinacn11/246/w646h400/20180321/445a-fyskeue0737376.jpg",
        "http://imgsrc.baidu.com/forum/pic/item/314e251f95cad1c84dbe069c7f3e6709c93d5100.jpg"),
    new VideoModel(
        "1",
        "甄嬛",
        "钮祜禄大小姐",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565940172014&di=38632d8ae5402a9aeda75327517bead4&imgtype=0&src=http%3A%2F%2Fimg00.hc360.com%2Fgift%2F201204%2F201204281008453847.jpg"),
    new VideoModel(
        "2",
        "年世兰",
        "年羹尧妹妹，华妃",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg",
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2572938105,1279627387&fm=26&gp=0.jpg"),
    new VideoModel(
        "3",
        "安陵容",
        "安小鸟，就会唱歌垃圾",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg",
        "http://b-ssl.duitang.com/uploads/item/201707/19/20170719234012_yjEdk.jpeg"),
    new VideoModel(
        "4",
        "果郡王",
        "甄嬛最爱的男人，没茅台",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg",
        "http://img.mp.itc.cn/upload/20160509/0ae3face14294702b5e135faad4a2aeb_th.jpg"),
    new VideoModel(
        "5",
        "沈眉庄",
        "甄嬛的眉姐姐，挺惨的",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg",
        "http://img1.gtimg.com/chengde_house/pics/hv1/20/193/15/1024610.jpg"),
    new VideoModel(
        "6",
        "皇上",
        "唉妈呀！绿的不要不要的",
        "http://n.sinaimg.cn/sinacn11/246/w646h400/20180321/445a-fyskeue0737376.jpg",
        "http://imgsrc.baidu.com/forum/pic/item/314e251f95cad1c84dbe069c7f3e6709c93d5100.jpg")
  ];

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayPage();
  }
}

class _VideoPlayPage extends State<VideoPlayPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  VoidCallback _showBottomSheetCallback;
  PageController _transController = new PageController();

  VideoChangeNotifier videoChangeNotifier = VideoChangeNotifier(0);
  var _currentPageValue = 0.0;
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _showBottomSheetCallback = _showBottomSheet;

    videoChangeNotifier.addListener(_hadValueChange);

    _transController.addListener(() {
      if (_currentPage != _currentPageValue.toInt()) {
        _currentPage = _currentPageValue.toInt();
        videoChangeNotifier.value = _currentPage;
      }
      setState(() {
        _currentPageValue = _transController.page;
      });
    });
  }

  void _showBottomSheet() {
    setState(() {
      // 禁用按钮
      _showBottomSheetCallback = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet<Null>((BuildContext context) {
          return BottomDragWidget(
            data: widget.arr,
            currentPosition: _currentPage,
            videoChangeNotifier: videoChangeNotifier,
          );
        })
        .closed
        .whenComplete(() {
          // mounted：bool值，这个State对象当前是否在树中
          if (mounted) {
            setState(() {
              // 重新启用按钮
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        floatingActionButton: new FloatingActionButton(
            onPressed: _showBottomSheetCallback,
            backgroundColor: Colors.redAccent[200],
            child: new Icon(Icons.add)),
        body: new Center(
            child: PageView.builder(
                controller: _transController,
                itemCount: widget.arr.length,
                physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  if (index == _currentPageValue.floor()) {
                    //将要出去的item
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateY(_currentPageValue - index),
                      alignment: FractionalOffset.centerRight,
                      child: VideoPlayWidget(),
                    );
                  } else if (index == _currentPageValue.floor() + 1) {
                    //将要进来的item
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateY(_currentPageValue - index),
                      alignment: FractionalOffset.centerLeft,
                      child: VideoPlayWidget(),
                    );
                  } else {
                    //其他，不在屏幕显示的item
                    return Image.network(
                      widget.arr[index].url,
                      fit: BoxFit.cover,
                    );
                  }
                })));
  }

  void _hadValueChange() {
    if (_currentPage == videoChangeNotifier.value) {
      return;
    }
    _transController.jumpToPage(videoChangeNotifier.value);
    setState(() {});
  }
}
