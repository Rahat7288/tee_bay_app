class ProductModel2 {
  ProductModel2({
      this.id, 
      this.seller, 
      this.title, 
      this.description, 
      this.categories, 
      this.productImage, 
      this.purchasePrice, 
      this.rentPrice, 
      this.rentOption, 
      this.datePosted,});

  ProductModel2.fromJson(dynamic json) {
    id = json['id'];
    seller = json['seller'];
    title = json['title'];
    description = json['description'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    productImage = json['product_image'];
    purchasePrice = json['purchase_price'];
    rentPrice = json['rent_price'];
    rentOption = json['rent_option'];
    datePosted = json['date_posted'];
  }
  num? id;
  num? seller;
  String? title;
  String? description;
  List<String>? categories;
  String? productImage;
  String? purchasePrice;
  String? rentPrice;
  String? rentOption;
  String? datePosted;
ProductModel2 copyWith({  num? id,
  num? seller,
  String? title,
  String? description,
  List<String>? categories,
  String? productImage,
  String? purchasePrice,
  String? rentPrice,
  String? rentOption,
  String? datePosted,
}) => ProductModel2(  id: id ?? this.id,
  seller: seller ?? this.seller,
  title: title ?? this.title,
  description: description ?? this.description,
  categories: categories ?? this.categories,
  productImage: productImage ?? this.productImage,
  purchasePrice: purchasePrice ?? this.purchasePrice,
  rentPrice: rentPrice ?? this.rentPrice,
  rentOption: rentOption ?? this.rentOption,
  datePosted: datePosted ?? this.datePosted,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['seller'] = seller;
    map['title'] = title;
    map['description'] = description;
    map['categories'] = categories;
    map['product_image'] = productImage;
    map['purchase_price'] = purchasePrice;
    map['rent_price'] = rentPrice;
    map['rent_option'] = rentOption;
    map['date_posted'] = datePosted;
    return map;
  }

}