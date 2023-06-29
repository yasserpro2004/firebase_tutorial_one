import 'package:firebase_tutorial_one/config/extensions.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

//enum ProductControl { wishlist, cart }

class ProductCardList extends StatelessWidget {
  //final ProductModel product;
  final ProductsControl controls;

  const ProductCardList({Key? key, required this.controls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ShadowWidget(
        child: Container(
          height: MediaQuery.of(context).size.width / 3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: colors[1], borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 4,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    //decoration: BoxDecoration(borderRadius:BorderRadius.circular(15) ),
                    child: ShadowWidget(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          controls.product.productImageURL,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        controls.product.productName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\$ ${controls.product.price.toString()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ].createShadow().toList(),
                ),
              ),
              Expanded(child: controls)
            ],
          ),
        ),
      ),
    );
  }

  final List<Color> colors = const [
    Color.fromARGB(255, 207, 207, 246),
    Color.fromARGB(255, 248, 215, 246),
    Color.fromARGB(255, 250, 215, 218),
    Color.fromARGB(255, 208, 246, 207),
  ];
}
