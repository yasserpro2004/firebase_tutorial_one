import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String categoryID;
  final String categoryName;
  final String categoryImageURL;

  const CategoriesModel({
    required this.categoryID,
    required this.categoryName,
    required this.categoryImageURL,
  });

  @override
  List<Object> get props => [categoryID, categoryName, categoryImageURL];

  static const List<CategoriesModel> categories = [
    CategoriesModel(
      categoryID: '',
      categoryName: 'Soft Drink',
      categoryImageURL:
          'https://www.irenefarm.co.za/wp-content/uploads/HERO_Worlds_Best_Soda_Bundaberg_shutterstock_679079920.jpg',
    ),
    CategoriesModel(
      categoryID: '',
      categoryName: 'Smothies',
      categoryImageURL:
          'https://www.evolvingtable.com/wp-content/uploads/2022/12/How-to-Make-Smoothie-1.jpg',
    ),
    CategoriesModel(
      categoryID: '',
      categoryName: 'Water',
      categoryImageURL:
          'https://assets3.thrillist.com/v1/image/2573608/1584x1056/crop;jpeg_quality=60;progressive.jpg',
    ),
  ];
}
