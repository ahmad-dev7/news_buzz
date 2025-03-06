import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  NewsFeedCubit() : super(NewsFeedLoading());
}

abstract class NewsFeedState {}

class NewsFeedLoading extends NewsFeedState {}

class NewsFeedLoaded extends NewsFeedState {}

class NewsFeedFailed extends NewsFeedState {}
