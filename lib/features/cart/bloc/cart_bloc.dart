import 'package:bloc/bloc.dart';
import 'package:bloc_mastering/data/cart_items.dart';
import 'package:bloc_mastering/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(
      (event, emit) {
        emit(CartSuccessState(cartItems: cartItems));
      },
    );
    on<CartRemoveFromCart>(
      (event, emit) {
        cartItems.remove(event.productModel);
        emit(CartSuccessState(cartItems: cartItems));
      },
    );
  }
}
