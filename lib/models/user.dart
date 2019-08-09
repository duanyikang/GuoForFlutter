class UserModel {
  String uid;
  String nikeName;

  UserModel({
    this.uid,
    this.nikeName,
  });

  UserModel.fromJson(Map json) {
    uid = json['uid'];
    nikeName = json['nikeName'];
  }
}
