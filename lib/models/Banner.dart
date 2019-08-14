class BannerBean {
  String id;
  String url;
  String type;
  String action;

  BannerBean({
    this.id,
    this.url,
    this.type,
    this.action,
  });

  BannerBean.fromJson(Map json) {
    id = json['id'];
    url = json['url'];
    type = json['type'];
    action = json['action'];
  }
}
