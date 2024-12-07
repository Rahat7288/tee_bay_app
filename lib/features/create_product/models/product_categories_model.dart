class ProductCategoriesModel {
  ProductCategoriesModel({
      this.value, 
      this.label,});

  ProductCategoriesModel.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }
  String? value;
  String? label;
ProductCategoriesModel copyWith({  String? value,
  String? label,
}) => ProductCategoriesModel(  value: value ?? this.value,
  label: label ?? this.label,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }

}