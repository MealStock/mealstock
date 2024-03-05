class Comment {
  int? id;
  final String text;
  final String user;
  final int like;
  final int dislike;
  Comment(
    this.like,
    this.dislike, {
    required this.id,
    required this.user,
    required this.text,
  });
}
