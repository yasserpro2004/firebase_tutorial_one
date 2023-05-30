import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String productID;
  final String productName;
  final String productDescription;
  final String productImageURL;
  final double price;
  final String productCategory;
  final bool isPopular;
  final bool isRecommend;

  const ProductModel({
    required this.productID,
    required this.productName,
    required this.productDescription,
    required this.productImageURL,
    required this.price,
    required this.productCategory,
    required this.isPopular,
    required this.isRecommend,
  });

  @override
  List<Object?> get props => [
        productID,
        productName,
        productDescription,
        productCategory,
        price,
        productImageURL,
        isPopular,
        isRecommend,
      ];

  static const List<ProductModel> products = [
    ProductModel(
      productID: '',
      productName: 'Coca Cola',
      productDescription:
          "Pemberton originally touted his drink as a tonic for most common ailments, basing it on cocaine from the coca leaf and caffeine-rich extracts of the kola nut; the cocaine was removed from Coca-Cola's formula in about 1903",
      price: 2.9,
      productImageURL:
          'https://mcprod.hyperone.com.eg/media/catalog/product/cache/1ca275941aea0ae98b372dcb44b7c67a/5/4/5449000181954-1.png',
      productCategory: 'Soft Drink',
      isPopular: true,
      isRecommend: false,
    ),
    ProductModel(
      productID: '',
      productName: 'Schweppes',
      productDescription:
          'Sophisticated fruit flavored light malt beverage, smooth enough for the adult palate yet packed with a lot of character and topped with the richness of malt.',
      price: 2.9,
      productImageURL:
          'https://cdnprod.mafretailproxy.com/sys-master-root/hcb/ha6/14584714788894/532194_main.jpg_480Wx480H',
      productCategory: 'Soft Drink',
      isPopular: false,
      isRecommend: true,
    ),
    ProductModel(
      productID: '',
      productName: 'Mirinda',
      productDescription:
          'Mirinda is an intensely refreshing fruit-flavored beverage, available in 5 different flavors: Orange, Green Cream, Strawberry, Mix-it Grape Melon and Mix-it Pineapple Passion Fruit.',
      price: 2.9,
      productImageURL:
          'https://cdnprod.mafretailproxy.com/sys-master-root/hea/h3a/14584258822174/463103_main.jpg_480Wx480H',
      productCategory: 'Soft Drink',
      isPopular: true,
      isRecommend: false,
    ),
    ProductModel(
      productID: '',
      productName: 'Berry-Kefir',
      productDescription:
          'Kefir is a tart and tangy cultured dairy drink packed with protein, calcium, and 12 live and active probiotic cultures.',
      price: 2.9,
      productImageURL:
          'https://www.eatingwell.com/thmb/eb287HWIEnB7be0EkzwWO1I_uzA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/EWL-57793-berry-kefir-smoothie-Hero-01-A-ae9e20c50f1843928b81c102bfa80b4c.jpg',
      productCategory: 'Smothies',
      isPopular: false,
      isRecommend: true,
    ),
    ProductModel(
      productID: '',
      productName: 'Fruit and Yogurt',
      productDescription:
          'Blueberry yoghurt is a soft, sweet and extremely delicious milk fermented product which has a Blueberries adding up to its exotic flavor is also a rich ...',
      price: 2.9,
      productImageURL:
          'https://www.allrecipes.com/thmb/cn_dwNWL0ve2IGweLAkNBskE72o=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/441727-fruit-and-yogurt-smoothie-Alberta-Rose-4x3-1-aa04390dac11483aaeeec142dff1f6c7.jpg',
      productCategory: 'Smothies',
      isPopular: true,
      isRecommend: false,
    ),
    ProductModel(
      productID: '',
      productName: 'Strawberries',
      productDescription:
          'The strawberry is a succulent and fragrant fruit of bright red colour, obtained from the plant with the same name. In the West it is considered as the " queen of the fruit". ',
      price: 2.9,
      productImageURL:
          'https://www.tasteofhome.com/wp-content/uploads/2018/01/Fruity-Red-Smoothies_exps15737_RDS2677379B02_15_4bC_RMS-1.jpg?fit=700,1024',
      productCategory: 'Smothies',
      isPopular: false,
      isRecommend: true,
    ),
    ProductModel(
      productID: '',
      productName: 'Nestle Pure Life',
      productDescription:
          'Nestlé® Pure Life® is a spring water that comes from protected, underground, natural sources and is suitable for all ages with exception of infants under six months.',
      price: 2.9,
      productImageURL:
          'https://gourmetegypt.com/media/catalog/product/1/l/1l.jpg?optimize=high&bg-color=255,255,255&fit=bounds&height=350&width=350&canvas=350:350',
      productCategory: 'Water',
      isPopular: true,
      isRecommend: false,
    ),
    ProductModel(
      productID: '',
      productName: 'Aquafina',
      productDescription:
          'an American brand of purified bottled water that is produced by PepsiCo, consisting of both unflavored and flavored water.',
      price: 2.9,
      productImageURL:
          'https://www.bigbasket.com/media/uploads/p/l/265894_7-aquafina-packaged-drinking-water.jpg',
      productCategory: 'Water',
      isPopular: false,
      isRecommend: true,
    ),
    ProductModel(
      productID: '',
      productName: 'Evian',
      productDescription:
          "It's a uniquely sourced mineral water that's always naturally hydrating and refreshing, with nothing added for taste or enhanced with extras ",
      price: 2.9,
      productImageURL:
          'https://gourmetegypt.com/media/catalog/product/w/a/water-photo_ycwzwqic1lgznkhq.jpg',
      productCategory: 'Water',
      isPopular: true,
      isRecommend: false,
    ),
  ];
}
