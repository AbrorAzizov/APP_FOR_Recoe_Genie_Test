

import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class HomeEvent {}

@immutable
class HomeEventFetchUsers extends HomeEvent{}

@immutable
class HomeEventCreatePost extends HomeEvent{}

