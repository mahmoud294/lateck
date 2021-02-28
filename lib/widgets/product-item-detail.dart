import 'package:flutter/material.dart';
import 'package:lateck/providers/products.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  String ids;
  ProductItem(this.ids);
  @override
  _ProductItemState createState() => _ProductItemState();
}

int _currentPage;

// final int _numPages = 3;

List<Widget> _buildPageIndicator(int _numPages) {
  List<Widget> list = [];

  for (int i = 0; i < _numPages; i++) {
    list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  }
  return list;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 2.0),
    height: 10,
    width: isActive ? 10.0 : 10.0,
    decoration: BoxDecoration(
      color: isActive ? Colors.grey[800] : Colors.grey[300],
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}

class _ProductItemState extends State<ProductItem> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<Products>(context).selectedProduct(widget.ids);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              '${prod.name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
            height: 190.0,
            child: Hero(
              tag: prod.id,
              child: PageView.builder(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: prod.images.length,
                itemBuilder: (ctx, index) =>
                    Image.network('${prod.images[index]}'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(prod.images.length),
          ),
          SizedBox(
            height: 13,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'Color',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,            
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(9),
                child: CircleAvatar(                
                  backgroundColor: Colors.red,                
                ),
              ),
              Container(
                margin: EdgeInsets.all(9),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,                
                ),
              ),
              Container(
                margin: EdgeInsets.all(9),
                child: CircleAvatar(
                  backgroundColor: Colors.black,                
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
