import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  String title;
  double price;
  int amount;
  Product({
    required this.amount,
    required this.price,
    required this.title,
  });

  factory Product.fromJson(Map<String,dynamic> json){
    return _$ProductFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$ProductToJson(this);
  }

}
