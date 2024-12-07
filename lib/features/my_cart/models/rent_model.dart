class RentModel {
  RentModel({
      this.id, 
      this.renter, 
      this.seller, 
      this.product, 
      this.rentOption, 
      this.rentPeriodStartDate, 
      this.rentPeriodEndDate, 
      this.totalPrice, 
      this.rentDate,});

  RentModel.fromJson(dynamic json) {
    id = json['id'];
    renter = json['renter'];
    seller = json['seller'];
    product = json['product'];
    rentOption = json['rent_option'];
    rentPeriodStartDate = json['rent_period_start_date'];
    rentPeriodEndDate = json['rent_period_end_date'];
    totalPrice = json['total_price'];
    rentDate = json['rent_date'];
  }
  num? id;
  num? renter;
  num? seller;
  num? product;
  String? rentOption;
  String? rentPeriodStartDate;
  String? rentPeriodEndDate;
  String? totalPrice;
  String? rentDate;
RentModel copyWith({  num? id,
  num? renter,
  num? seller,
  num? product,
  String? rentOption,
  String? rentPeriodStartDate,
  String? rentPeriodEndDate,
  String? totalPrice,
  String? rentDate,
}) => RentModel(  id: id ?? this.id,
  renter: renter ?? this.renter,
  seller: seller ?? this.seller,
  product: product ?? this.product,
  rentOption: rentOption ?? this.rentOption,
  rentPeriodStartDate: rentPeriodStartDate ?? this.rentPeriodStartDate,
  rentPeriodEndDate: rentPeriodEndDate ?? this.rentPeriodEndDate,
  totalPrice: totalPrice ?? this.totalPrice,
  rentDate: rentDate ?? this.rentDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['renter'] = renter;
    map['seller'] = seller;
    map['product'] = product;
    map['rent_option'] = rentOption;
    map['rent_period_start_date'] = rentPeriodStartDate;
    map['rent_period_end_date'] = rentPeriodEndDate;
    map['total_price'] = totalPrice;
    map['rent_date'] = rentDate;
    return map;
  }

}