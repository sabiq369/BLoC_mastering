part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class LoadedSuccessState extends HomeState {
  final List<ProductModel> products;
  LoadedSuccessState({required this.products});
}

class ErrorState extends HomeState {}

class NavigateToWishlistState extends HomeActionState {}

class NavigateToCartState extends HomeActionState {}
