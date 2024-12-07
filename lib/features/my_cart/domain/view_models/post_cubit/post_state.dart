import 'package:equatable/equatable.dart';

import '../../../data/models/todo_model.dart';

abstract class PostState extends Equatable {}

class PostInitial extends PostState {
  @override
  List<Object?> get props => [];
}

class PostStateLoading extends PostState {
  @override
  List<Object?> get props => [];
}

class PostStateSuccess extends PostState {
  final List<TodoModel>? todos;
  PostStateSuccess({this.todos});
  @override
  List<Object?> get props => [todos];
}

class PosStateError extends PostState {
  final String? error;
  PosStateError({this.error});
  @override
  List<Object?> get props => [error];
}
