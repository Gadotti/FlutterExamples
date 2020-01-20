import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  final List<String> _categories = [
    "Trabalho",
    "Estudos",
    "Casa"
  ];

  int _category = 0;

  void _selectFoward() {
    setState(() {
      _category++;
    });
  }


  void _selectBackward() {
    setState(() {
      _category--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            disabledColor: Colors.white30,
            onPressed: _category > 0 ?_selectBackward : null,
          ),
          Text(
            _categories[_category],
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w300
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            color: Colors.white,
            disabledColor: Colors.white30,
            onPressed:_category < _categories.length - 1 ?_selectFoward : null,
          )
        ],
      ),
    );
  }
}
