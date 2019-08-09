class VideoModel {
  String vid;
  String name;
  String desc;
  String cover;

  VideoModel({
    this.vid,
    this.name,
    this.desc,
    this.cover,
  });

  VideoModel.fromJson(Map json) {
    vid = json['vid'];
    name = json['name'];
    desc = json['desc'];
    cover = json['cover'];
  }
}
