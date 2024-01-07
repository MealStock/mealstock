import 'Comment.dart';

class Photo {
  int? id;
  final String name;
  final double size;
  final String url;
  final int like;
  final int dislike;
  final List<Comment> comment;

  Photo(
    this.name,
    this.like,
    this.dislike,
    this.comment, {
    required this.id,
    required this.size,
    required this.url,
  });
}
