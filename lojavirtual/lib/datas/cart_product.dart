import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/datas/product_data.dart';

class CartProduct {

  String id;
  String category;
  String productId;
  int quantity;
  String size;

  ProductData productData;

  CartProduct.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    category = document.data["category"];
    productId = document.data["productId"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  CartProduct();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "category": category,
      "quantity": quantity,
      "size": size,
      "productId": productId,
      "product": productData.toResumeMap()
    };
  }

}