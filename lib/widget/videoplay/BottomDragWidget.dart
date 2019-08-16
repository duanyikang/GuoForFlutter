import 'package:flutter/material.dart';
import 'package:flutter_app/delegate/VideoChangeNotifier.dart';
import 'package:flutter_app/models/video.dart';

class BottomDragWidget extends StatefulWidget {
  final List<VideoModel> data;
  final int currentPosition;
  final VideoChangeNotifier videoChangeNotifier;

  const BottomDragWidget(
      {Key key, this.data, this.currentPosition, this.videoChangeNotifier})
      : super(key: key);

  @override
  _BottomDragWidgetState createState() => _BottomDragWidgetState();
}

class _BottomDragWidgetState extends State<BottomDragWidget> {
  int myposition;
  ScrollController scrollController=new ScrollController();

  @override
  void initState() {
    super.initState();
    widget.videoChangeNotifier.addListener(_handleValueChanged);
    myposition = widget.currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.transparent,
      child: ListView.builder(
        controller: scrollController,
        itemCount: widget.data?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                _onClick(index);
              },
              child: Container(
                  width: 150,
                  margin: EdgeInsets.fromLTRB(4, 0, 4, 2),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                          child: FadeInImage.assetNetwork(
                            width: 149,
                            height: 300,
                            placeholder: 'assets/images/iv_default_avatar.png',
                            image: widget.data[index].cover,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          )),
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              gradient: new LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.transparent,
                                  ]),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  widget.data[index].name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  widget.data[index].desc,
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.topRight,
                        child: myposition == index ? Icon(Icons.check) : null,
                      )
                    ],
                  )));
        },
      ),
    );
  }

  void _onClick(int index) {
    myposition = index;
    widget.videoChangeNotifier.value=myposition;
    setState(() {

    });
  }

  void _handleValueChanged() {
    myposition = widget.videoChangeNotifier.value;
    scrollController.animateTo(scrollController.position.maxScrollExtent/widget.data.length*myposition,
        duration: Duration(milliseconds: 600), curve: Curves.easeIn);

    setState(() {
      
    });
  }
}
