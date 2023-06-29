import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_tutorial_one/repositories/products/product_repository.dart';

import '../../models/models.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;
  StreamSubscription? _streamSubscription;
  ProductsBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductsInitial()) {
    on<StartLoadingProduct>((event, emit) {
      _streamSubscription?.cancel();
      _streamSubscription = _productRepository.getAllProducts().listen((data) {
        add(UpdateProductsEvent(data: data));
      });
    });
    on<UpdateProductsEvent>((event, emit) {
      emit(LoadedProductsState(data: event.data));
    });
  }
}
