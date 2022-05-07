// ignore_for_file: file_names
import 'package:flutter/widgets.dart';
import 'package:rafiq/core/constants/authentication_const.dart';
import 'package:rafiq/core/constants/url.dart';
import 'package:rafiq/data/data_API/dio_helper.dart';
import 'package:rafiq/data/models/post_like.dart';

class PostLikeAPI {
  Future<PostLikeModel> makeLikeToPost({required String postId}) async {
    final response = await DioHelper.putWithHeader(
      url: '$URL/api/v1/users/abc/posts/$postId/like',
      header: {'access-token': token},
    );
    return PostLikeModel.fromJson(response.data);
  }
}