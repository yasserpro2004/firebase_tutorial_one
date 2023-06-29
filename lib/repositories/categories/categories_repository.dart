import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial_one/models/category_model.dart';
import 'package:firebase_tutorial_one/repositories/categories/base_categories_repository.dart';

class CategoriesRepository extends BaseCategoriesRepository {
  final FirebaseFirestore _firebaseFirestore;

   CategoriesRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<CategoriesModel>> getAllCategories()  {
    final data =
         _firebaseFirestore.collection('categories').snapshots().map(
              (snapshot) => snapshot.docs
                  .map(
                    (doc) => CategoriesModel.getCategoryFromSnapshot(doc),
                  )
                  .toList(),
            );
    return data;
  }
}
