import 'package:bloc_mastering/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      // listenWhen: (previous, current) {},
      // buildWhen: (previous, current) {},
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
          body: SafeArea(child: Column()),
        );
      },
    );
  }
}
