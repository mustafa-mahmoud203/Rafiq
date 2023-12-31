part of 'add_post_cubit.dart';

@immutable
abstract class AddPostState {}

class AddPostInitial extends AddPostState {}

class AddPostLoadingState extends AddPostState {}

class AddPostSuccessState extends AddPostState {}

class AddPostErrorState extends AddPostState {}

class GetSingleImageSuccess extends AddPostState {}

class ChangeColorState extends AddPostState {}

class GetVideoSuccess extends AddPostState {}

class ChangeValueState extends AddPostState {}

class NonClickableState extends AddPostState {}
