import 'package:fast_app_base/entity/post/vo_simple_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_product_post.freezed.dart';

@freezed
class ProductPost with _$ProductPost {
  const factory ProductPost(
    final SimpleProductPost simpleProductPost,
    final String content,
  ) = _ProductPost;
}