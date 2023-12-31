import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_viewer/image_viewer.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:rafiq/logic/cubit/add_post_cubit/add_post_cubit.dart';
import 'package:rafiq/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:rafiq/logic/cubit/search_cubit/search_cubit.dart';

void showTosat({required msg, required state}) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: state ? const Color(0Xff575D85) : Colors.amber,
      textColor: Colors.white,
      fontSize: 15.0,
    );

void showValidationTosat(context, message) {
  MotionToast.error(
    title: const Text(
      'Error',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    description: Text(message,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    toastDuration: const Duration(milliseconds: 2500),
    animationType: ANIMATION.fromRight,
    animationCurve: Curves.decelerate,
    position: MOTION_TOAST_POSITION.top,
  ).show(context);
}

Future showSuccessTosat(context, String message) async {
  MotionToast.success(
    title: const Text(
      "Success",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    description: Text(message,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
    toastDuration: const Duration(milliseconds: 2500),
    animationType: ANIMATION.fromRight,
    animationCurve: Curves.decelerate,
    position: MOTION_TOAST_POSITION.top,
  ).show(context);
}

final ImagePicker _image = ImagePicker();

Future<void> getAvatarFromGalleryOrCamera(context, imageSource) async {
  final XFile? _avatarimage = await _image.pickImage(source: imageSource);
  if (_avatarimage == null) return;

  BlocProvider.of<ProfileCubit>(context).fileAvatarImagePath(_avatarimage);
  BlocProvider.of<ProfileCubit>(context)
      .setAvatar(file: BlocProvider.of<ProfileCubit>(context).avatarImageFile);
}

Future<void> getCoverFromGalleryOrCamera(context, imageSource) async {
  final XFile? coverImage = await _image.pickImage(source: imageSource);

  if (coverImage == null) return;
  BlocProvider.of<ProfileCubit>(context).fileCoverImagePath(coverImage);
  BlocProvider.of<ProfileCubit>(context)
      .setCover(file: BlocProvider.of<ProfileCubit>(context).coverImageFile);
}

List<String> images = [];

void imageView(images) {
  ImageViewer.showImageSlider(
    images: images,
  );
}

Future<void> getImagePostFromCamera(context) async {
  final XFile? _images = await _image.pickImage(source: ImageSource.camera);
  if (_images == null) return;

  BlocProvider.of<AddPostCubit>(context).addSingleImagepostFiles(_images);
}

Future<void> getMultiImagePost(context) async {
  final List<XFile>? _imagesList = await _image.pickMultiImage();
  if (_imagesList == null) {
    return;
  }

  BlocProvider.of<AddPostCubit>(context).imagesList.addAll(_imagesList);
  BlocProvider.of<AddPostCubit>(context).convert();
}

Future<void> getVideoPost(context, videoSource) async {
  final XFile? _video = await _image.pickVideo(source: videoSource);
  if (_video == null) return;

  BlocProvider.of<AddPostCubit>(context).addVideopostFiles(_video);
}

Future<void> searchImageFromGallery(context) async {
  final XFile? _images = await _image.pickImage(source: ImageSource.gallery);
  if (_images == null) return;

  BlocProvider.of<SearchCubit>(context).getImageFromGellureToSearch(_images);
}

Widget buildRating(double rate) {
  List<Icon> icon = [];

  for (int i = 0; i < 5; i++) {
    if (rate < 1 && rate > 0 && rate > 0.4) {
      icon.add(
        const Icon(Icons.star_half, color: Colors.yellow),
      );
    } else if (rate >= 1) {
      icon.add(const Icon(Icons.star, color: Colors.yellow));
    } else {
      icon.add(const Icon(Icons.star_border, color: Colors.yellow));
    }
    rate--;
  }
  return Row(
    children: [
      for (int i = 0; i < 5; i++) icon[i],
    ],
  );
}
