import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/OffsetNotifierData.dart';
import 'package:flutter_app/models/HeadBean.dart';

class DestinationSearchWidget extends StatefulWidget {
  final OffsetNoitiferData data;
  final HeadBean headBean;

  DestinationSearchWidget({this.data, this.headBean});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DestinationSearchWidget();
  }
}

class _DestinationSearchWidget extends State<DestinationSearchWidget> {
  final _controller = TextEditingController();
  final double MAX = 130;
  double currentValue = 0;

  @override
  void initState() {
    super.initState();
    widget.data.addListener(_handleValueChanged);
    _controller.addListener(() {
      if (_controller.value.text.length == 11) {
      } else {}
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Stack(
      children: <Widget>[
        Opacity(
            opacity: 1-currentValue,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://img0.iterduo.com/15392379478678224.jpg"),
                      fit: BoxFit.cover)),
            )),
        Container(
          color: Color.fromARGB((currentValue * 255).toInt(), 255, 255, 255),
          padding: EdgeInsets.fromLTRB(
              0, MediaQuery.of(context).padding.top + 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width: (1 - currentValue) * width / 4,
                    alignment: Alignment.center,
                    child: Text(
                      widget.headBean == null ? '美国' : widget.headBean.local,
                      softWrap: false,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      height: 30,
                      width: currentValue * width / 4 + width * 3 / 4 - 40,
                      margin: EdgeInsets.only(left: 10),
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            labelText: '搜索当地玩乐/美食/路线等'),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: (1 - currentValue * 7) * 30 <= 0
                        ? 0
                        : (1 - currentValue * 3) * 30,
                    width: width / 4,
                    alignment: Alignment.center,
                    child: Text(
                        widget.headBean == null
                            ? '100摄氏度'
                            : '温度${widget.headBean.temperature}',
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    height: (1 - currentValue * 7) * 30 <= 0
                        ? 0
                        : (1 - currentValue * 3) * 30,
                    width: width * 3 / 4 - 40,
                    alignment: Alignment.centerRight,
                    child: Text(
                        widget.headBean == null
                            ? '没人和你一起'
                            : '${widget.headBean.number}人正在和你同行',
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void _handleValueChanged() {
    setState(() {
      currentValue = widget.data.value / MAX;
    });
  }
}
