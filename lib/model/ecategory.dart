class ECategory {
  String id;
  String cName;
  String image;

  ECategory({this.id, this.cName, this.image});

  ECategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cName = json['cname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cname'] = this.cName;
    data['image'] = this.image;
    return data;
  }
}
