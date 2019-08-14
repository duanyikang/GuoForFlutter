import 'package:flutter/material.dart';
import 'package:flutter_app/models/starShop.dart';

class StarItemWidget extends StatefulWidget {
  StarShopModel starShopModel;

  StarItemWidget({Key key, this.starShopModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StarItemWidget();
  }
}

class _StarItemWidget extends State<StarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/stardetail', arguments: widget.starShopModel);
        },
        splashColor: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: new ClipRRect(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/iv_default_avatar.png',
                      image: widget.starShopModel.cover,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ))),
            Text(
              widget.starShopModel.desc,
              maxLines: 1,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Text(
              widget.starShopModel.name,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 25),
            )
          ],
        ));
  }
}
