class PurchasesModel {
  PurchasesModel({
      this.id, 
      this.buyer, 
      this.seller, 
      this.product, 
      this.purchaseDate,});

  PurchasesModel.fromJson(dynamic json) {
    id = json['id'];
    buyer = json['buyer'];
    seller = json['seller'];
    product = json['product'];
    purchaseDate = json['purchase_date'];
  }
  num? id;
  num? buyer;
  num? seller;
  num? product;
  String? purchaseDate;
PurchasesModel copyWith({  num? id,
  num? buyer,
  num? seller,
  num? product,
  String? purchaseDate,
}) => PurchasesModel(  id: id ?? this.id,
  buyer: buyer ?? this.buyer,
  seller: seller ?? this.seller,
  product: product ?? this.product,
  purchaseDate: purchaseDate ?? this.purchaseDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['buyer'] = buyer;
    map['seller'] = seller;
    map['product'] = product;
    map['purchase_date'] = purchaseDate;
    return map;
  }

}