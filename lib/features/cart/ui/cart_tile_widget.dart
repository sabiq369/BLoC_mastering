import 'package:bloc_mastering/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_mastering/features/home/bloc/home_bloc.dart';
import 'package:bloc_mastering/features/home/models/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWidget extends StatelessWidget {
  final ProductModel productModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {Key? key, required this.productModel, required this.cartBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Image.network(
              productModel.image,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(productModel.name),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(productModel.description),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text('\$ ${productModel.price.toString()}'),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart_rounded),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
