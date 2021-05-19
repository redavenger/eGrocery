class groceryCart {
  String id;
  String productName;
  String price;
  String quantity;
  String size;
  String email;
  String image;

  groceryCart(
      {this.id,
        this.productName,
        this.price,
        this.quantity,
        this.size,
        this.email,
        this.image});

  groceryCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}