import 'package:firebase_tutorial_one/config/constants.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: MediaQuery.of(context).size.width / 2.5,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            color: colors.getRandomElement(),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/productDetails', arguments: product);
                },
                child: SizedBox(
                    height: MediaQuery.of(context).size.width / 4,
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Image.network(
                      product.productImageURL,
                      fit: BoxFit.fill,
                    )),
              ),
            ]),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Icon(Icons.favorite_border_outlined,
                                color: Colors.grey, size: 20)),
                        Column(
                          children: [
                            Text(
                              product.productName,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$ ${product.price.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.grey,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
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
