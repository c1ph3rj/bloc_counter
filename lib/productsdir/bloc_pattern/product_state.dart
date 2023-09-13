part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class DataLoadedState extends ProductState {
  final List<Product> products;
  DataLoadedState(this.products);
}

class ErrorState extends ProductState {
  final String errorString;
  ErrorState(this.errorString);
}