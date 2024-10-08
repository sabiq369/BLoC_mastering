import 'package:bloc/bloc.dart';
import 'package:bloc_mastering/data/cart_items.dart';
import 'package:bloc_mastering/data/grocery_data.dart';
import 'package:bloc_mastering/data/wishlist_items.dart';
import 'package:bloc_mastering/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<InitialEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        await Future.delayed(Duration(seconds: 3));
        emit(LoadedSuccessState(
            products: GroceryData.groceryProducts
                .map(
                  (e) => ProductModel(
                      id: e["id"],
                      name: e['name'],
                      price: e["price"],
                      description: e["description"],
                      image: e["image"]),
                )
                .toList()));
      },
    );
    on<WishlistButtonClickedEvent>(
      (event, emit) {
        wishListItems.add(event.clickedProduct);
      },
    );
    on<CartButtonClickedEvent>(
      (event, emit) {
        cartItems.add(event.clickedProduct);
      },
    );
    on<NavigateToWishlistEvent>(
      (event, emit) {
        emit(NavigateToWishlistState());
        print('Wishlist clicked');
      },
    );
    on<NavigateToCartEvent>(
      (event, emit) {
        emit(NavigateToCartState());

        print('Cart clicked');
      },
    );
  }
}
