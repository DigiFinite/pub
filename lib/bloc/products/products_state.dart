part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitialState extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsSuccessfulState extends ProductsState {
  final List<Product> products;
  const ProductsSuccessfulState({
    required this.products,
  });
  @override
  List<Object> get props => [products];
}


class ProductsFailedState extends ProductsState {
  final dynamic data;
  const ProductsFailedState({
    required this.data
  });
  @override
  List<Object> get props => [data];
}
