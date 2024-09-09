import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<WishlistButtonClickedEvent>(
      (event, emit) {},
    );
    on<CartButtonClickedEvent>(
      (event, emit) {},
    );
    on<NavigateToWishlistEvent>(
      (event, emit) {
        print('Wishlist clicked');
      },
    );
    on<NavigateToCartEvent>(
      (event, emit) {
        print('Cart clicked');
      },
    );
  }
}
