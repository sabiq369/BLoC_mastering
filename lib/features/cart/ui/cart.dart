import 'package:bloc_mastering/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_mastering/features/cart/ui/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final CartBloc cartBloc = CartBloc();

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is! CartActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            final cartSuccessState = state as CartSuccessState;
            return ListView.builder(
              itemCount: cartSuccessState.cartItems.length,
              itemBuilder: (context, index) {
                return CartTileWidget(
                  cartBloc: cartBloc,
                  productModel: cartSuccessState.cartItems[index],
                );
              },
            );

          default:
        }
        return SizedBox();
      },
    ));
  }
}
