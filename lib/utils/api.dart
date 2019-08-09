import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

getStarList() async {
  var res = await http.post('http://10.10.20.9:8080/listinfo');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("Request failed with status: ${res.statusCode}.");
  }
}

getVideoDetail(id) async {
  var res = await http.post('http://10.10.20.9:8080/videosinfo');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("Request failed with status: ${res.statusCode}.");
  }
}
