class VideoModel {
  String vid;
  String name;
  String desc;
  String cover;
  String url;

  VideoModel(this.vid, this.name, this.desc, this.cover, this.url);

  VideoModel.fromJson(Map json) {
    vid = json['vid'];
    name = json['name'];
    desc = json['desc'];
    cover = json['cover'];
    url = json['url'];
  }
}
