import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String productID;
  final String productName;
  final String productImageURL;
  final double price;
  final String productCategory;
  final bool isPopular;
  final bool isRecommend;

  const ProductModel({
    required this.productID,
    required this.productName,
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
      price: 2.9,
      productImageURL:
          'https://gourmetegypt.com/media/catalog/product/w/a/water-photo_ycwzwqic1lgznkhq.jpg',
      productCategory: 'Water',
      isPopular: true,
      isRecommend: false,
    ),
  ];
}
