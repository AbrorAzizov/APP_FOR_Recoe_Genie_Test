import 'package:bloc/bloc.dart';

import '../../home/domain/entities/post.dart';


class CartCubit extends Cubit<List<Post>> {
  CartCubit() : super([]);

  void addItem(Post post) {
    final exists = state.any((i) => i.id == post.id);
    if (!exists) {
      emit([...state, post]);
    }
  }

  void removePost(String id) {
    emit(state.where((item) => item.id != id).toList());
  }

  double get totalPrice {
    return state.fold(0, (sum, item) => sum + item.price);
  }}