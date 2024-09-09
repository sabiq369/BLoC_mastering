part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeAddToWishlist extends HomeEvent {}

class HomeAddToCart extends HomeEvent {}

class HomeNavigateToWishlist extends HomeEvent {}

class HomeNavigateToCart extends HomeEvent {}
