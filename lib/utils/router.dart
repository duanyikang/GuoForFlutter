import 'package:flutter/material.dart';
import 'package:flutter_app/pages/IndexPage.dart';
import 'package:flutter_app/pages/dialogPage.dart';
import 'package:flutter_app/pages/loginByPhonePage.dart';
import 'package:flutter_app/pages/starDetailPage.dart';
import 'package:flutter_app/pages/welcomePage.dart';
import 'package:flutter_app/refresh/page/load_more.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => WelcomePage());
    case "/index":
      return MaterialPageRoute(builder: (context) => IndexPage());
    case "/stardetail":
      var arguments = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => StarDetailPage(starShopModel: arguments));
    case "/loginByPhone":
      return MaterialPageRoute(builder: (context) => LoginByPhonePage());
    case "/loadmore":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => LoaderMoreDemo(arguments));
    case "/dialogpage":
      return MaterialPageRoute(builder: (context) => DialogPage());
    default:
      return MaterialPageRoute(builder: (context) => IndexPage());
  }
}
