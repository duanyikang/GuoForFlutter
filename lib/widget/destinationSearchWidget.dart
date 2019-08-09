import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/OffsetNotifierData.dart';

class DestinationSearchWidget extends StatefulWidget {
  final OffsetNoitiferData data;

  DestinationSearchWidget({this.data});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DestinationSearchWidget();
  }
}

class _DestinationSearchWidget extends State<DestinationSearchWidget> {
  final _controller = TextEditingController();
  final double MAX = 150;
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
    return Container(
        color: Colors.white,
        child: Container(
          color: Color.fromARGB(255 - currentValue.toInt(), 255, 97, 0),
          padding: EdgeInsets.fromLTRB(
              10, MediaQuery.of(context).padding.top + 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '北京',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                        height: 30,
                        decoration: new BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              controller: _controller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(Icons.search),
                                  labelText: '搜索当地玩乐/美食/路线等'),
                            ))),
                    flex: 4,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('温度', style: TextStyle(color: Colors.white)),
                  ),
                  Expanded(
                    child:
                        Text('有不少人在旅行', style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void _handleValueChanged() {
    setState(() {
      currentValue = widget.data.value;
    });
  }
}
