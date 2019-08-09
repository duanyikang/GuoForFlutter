class StarShopModel {
  String id;
  String name;
  String desc;
  String cover;

  StarShopModel({
    this.id,
    this.name,
    this.desc,
    this.cover,
  });

  StarShopModel.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    cover = json['cover'];
  }
}
