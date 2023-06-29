part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}


class StartCategoriesLoading extends CategoriesEvent {}

class UpdateCategories extends CategoriesEvent {
  final List<CategoriesModel> categories;

  const UpdateCategories({required this.categories});

  @override
  List<Object> get props => [categories];
}

