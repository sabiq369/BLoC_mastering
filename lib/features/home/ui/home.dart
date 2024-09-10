import 'package:bloc_mastering/features/cart/ui/cart.dart';
import 'package:bloc_mastering/features/home/bloc/home_bloc.dart';
import 'package:bloc_mastering/features/home/ui/product_tile_widget.dart';
import 'package:bloc_mastering/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToWishlistState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WishlistScreen(),
              ));
        } else if (state is NavigateToCartState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            );
          case LoadedSuccessState:
            final successState = state as LoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text('Grocery'),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(NavigateToWishlistEvent());
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(NavigateToCartEvent());
                    },
                    icon: Icon(Icons.shopping_cart_rounded),
                  ),
                ],
              ),
              body: Scaffold(
                body: SafeArea(
                  child: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                          productModel: successState.products[index]);
                    },
                  ),
                ),
              ),
            );
          case ErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
