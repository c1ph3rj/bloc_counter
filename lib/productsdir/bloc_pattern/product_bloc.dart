import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../ApiReqeust/ProdutServiceRepo.dart';
import '../ApiReqeust/model/Product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductServiceRepo productServiceRepo;

  ProductBloc({required this.productServiceRepo}) : super(InitialState()) {
    on<FetchAllProductsEvent>((event, emit) async {
      emit(LoadingState());
      try {
        List<Product> products = await productServiceRepo.getAllProducts();
        emit(DataLoadedState(products));
      } catch (e) {
        emit(ErrorState("Error fetching the Products: $e"));
      }
    });
  }
}
