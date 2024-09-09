part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class WishlistButtonClickedEvent extends HomeEvent {}

class CartButtonClickedEvent extends HomeEvent {}

class NavigateToWishlistEvent extends HomeEvent {}

class NavigateToCartEvent extends HomeEvent {}
