import '../../models/category_model.dart';

abstract class BaseCategoriesRepository {
  Stream<List<CategoriesModel>> getAllCategories();
}
