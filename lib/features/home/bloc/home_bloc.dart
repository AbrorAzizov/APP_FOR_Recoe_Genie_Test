import 'package:bloc/bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';
import '../domain/entities/post.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventCreatePost>(_onHomeEventCreateUser);
  }

  Future<void> _onHomeEventCreateUser(
      HomeEventCreatePost event,
      Emitter<HomeState> emit,
      Post post) async{

  }
}
