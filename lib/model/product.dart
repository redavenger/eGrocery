class Product {
  String id;
  String name;
  String price;
  String stock;
  String description;
  String cName;
  String image;

  Product(
      {this.id,
        this.name,
        this.price,
        this.stock,
        this.description,
        this.cName,
        this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    stock = json['stock'];
    description = json['description'];
    cName = json['cname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['description'] = this.description;
    data['cname'] = this.cName;
    data['image'] = this.image;
    return data;
  }
}
