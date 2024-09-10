part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCart extends CartEvent {
  final ProductModel productModel;

  CartRemoveFromCart({required this.productModel});
}
