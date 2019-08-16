import 'package:flutter/material.dart';
import 'package:flutter_app/pages/IndexItemPage.dart';
import 'package:flutter_app/pages/PersonalPage.dart';
import 'package:flutter_app/utils/api.dart' as api;
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<dynamic> starList = [];
  final ValueNotifier<String> user = ValueNotifier<String>("");

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 20);
    init();
  }

  init() async {
    List res = await api.getStarList();
    setState(() {
      starList = res;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<String> userName = _get();
    userName.then((String userName) {
      user.value = userName;
    });
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Image.asset(
            "assets/images/iv_index_logo.jpeg",
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          actions: <Widget>[
            Center(child: Builder(builder: (BuildContext context) {
              return RaisedButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  shape: new CircleBorder(
                      side: new BorderSide(
                    style: BorderStyle.solid,
                  )),
                  child: ClipOval(
                      child: FadeInImage.assetNetwork(
                    width: 35,
                    height: 35,
                    placeholder: 'assets/images/iv_default_avatar.png',
                    image: user.value == null
                        ? ''
                        : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565178106&di=39712d9dad57f821e031adbae6a761c6&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.deyu.ln.cn%2Fimages%2Fnfwwonjogv2xg4dpoj2c4y3pnu%2Fdata%2Fattachment%2Fforum%2F201507%2F31%2F141617vpcp0p0kcr04tq4g.jpg',
                    fit: BoxFit.cover,
                  )));
            }))
          ],
        ),
        endDrawer: PersonalPage(),
        body: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorPadding: EdgeInsets.fromLTRB(25, 0, 25, 10),
              tabs: <Widget>[
                Tab(text: 'NBA'),
                Tab(text: 'CBA'),
                Tab(text: '中超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: 'NBA'),
                Tab(text: 'CBA'),
                Tab(text: '中超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
                Tab(text: '英超'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  IndexItemList(data: starList, hasBanner: true),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: true),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                  IndexItemList(data: starList, hasBanner: false),
                ],
              ),
            )
          ],
        ));
  }

  Future<String> _get() async {
    var userName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("user");
    return userName;
  }
}
