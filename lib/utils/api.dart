import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

getStarList() async {
  var res = await http.get('http://10.10.20.9:8080/sports/getList');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("Request failed with status: ${res.statusCode}.");
  }
}

getVideoDetail(id) async {
  var res = await http.get('http://10.10.20.9:8080/sports/getVideoDetail');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("Request failed with status: ${res.statusCode}.");
  }
}

getBanner()async{
  var res = await http.get('http://10.10.20.9:8080/sports/getBanner');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {

  }
}

getHeadInfo(local)async{
  var res = await http.get('http://10.10.20.9:8080/mdd/getMddHeadInfo?local=$local');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("走到我了？2222: ${res.statusCode}.");
  }
}


getBottomTags(local)async{
  var res = await http.get('http://10.10.20.9:8080/mdd/getMddBottomTags?local=$local');
  if (res.statusCode == 200) {
    return convert.jsonDecode(res.body)['data'];
  } else {
    print("走到我了？2222: ${res.statusCode}.");
  }
}

