import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/repositories/categories/categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/category_model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository;
  StreamSubscription? _streamSubscription;
  CategoriesBloc({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(CategoriesInitial()) {
    on<StartCategoriesLoading>(
      (event, emit) {
        _streamSubscription?.cancel();
        _streamSubscription = _categoriesRepository.getAllCategories().listen(
              (categories) => add(UpdateCategories(categories: categories)),
            );
      },
    );
    on<UpdateCategories>(
      (event, emit) {
        emit(CategoriesLoaded(categories: event.categories));
      },
    );
  }
}
