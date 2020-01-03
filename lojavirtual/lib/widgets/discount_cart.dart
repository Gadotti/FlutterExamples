import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/models/cart_model.dart';

class DiscountCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Cupom de deconto",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey[700]
          ),
        ),
        leading: Icon(Icons.card_giftcard),
        trailing: Icon(Icons.add),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite seu cupom"
              ),
              initialValue: CartModel.of(context).cupomCode ?? "",
              onFieldSubmitted: (text) {
                Firestore.instance.collection("cupons").document(text).get().then(
                  (docSnap) {
                    if (docSnap.data != null) {
                      CartModel.of(context).setCupom(text, docSnap.data["percent"]);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Desconto de ${docSnap.data["percent"]}% aplicado!"),
                        )
                      );
                    }
                    else {
                      CartModel.of(context).setCupom(null, 0);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Cupom não encontrado!"),
                          backgroundColor: Colors.redAccent,
                        )
                      );                      
                    }
                  }
                );
              },
            ),
          )
        ],
      ),
    );
  }
}