import 'package:bloc/bloc.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_event.dart';
import 'package:qolber_clean_arc/features/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventCreatePost>(_onHomeEventCreateUser);
  }

  Future<void> _onHomeEventCreateUser(Post post) async{}
}
