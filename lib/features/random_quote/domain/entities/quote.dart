import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final String author;
  final String content;
  final int id;
  final String permalink;

  const Quote({
    required this.author,
    required this.content,
    required this.id,
    required this.permalink,
  });

  @override
  List<Object?> get props => [author, content, id, permalink];
}
