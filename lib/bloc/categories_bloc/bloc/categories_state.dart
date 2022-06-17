part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class CategoriesSuccessfulState extends CategoriesState {
  final List<Category> categories;
  const CategoriesSuccessfulState({
    required this.categories,
  });
  @override
  List<Object> get props => [categories];
}

class CategoriesFailedState extends CategoriesState {
  final dynamic data;
  const CategoriesFailedState({
    required this.data
  });
  @override
  List<Object> get props => [data];
}
