class HeadBean {
  String local;
  String bgUrl;
  int temperature;
  int number;

  HeadBean({
    this.local,
    this.bgUrl,
    this.temperature,
    this.number,
  });

  HeadBean.fromJson(Map json) {
    local = json['local'];
    bgUrl = json['bgUrl'];
    temperature = json['temperature'];
    number = json['number'];
  }
}
