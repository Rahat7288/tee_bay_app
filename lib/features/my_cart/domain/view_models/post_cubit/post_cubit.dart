import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/features/my_cart/domain/view_models/post_cubit/post_state.dart';

import '../../../data/models/todo_model.dart';
import '../../repositories/post_repository/post_repository_impl.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  final _postRepoImple = PostRepositoryImpl();

  final List<TodoModel> todos = [];

  void getAllPost(context) {
    emit(PostStateLoading());
    _postRepoImple.getPost(payload: null, context: context).then((value) {
      if (kDebugMode) {
        print("Post response $value");
      }
      if (value != null) {
        todos.add(TodoModel.fromJson(value));

        if (kDebugMode) {
          print('todos========================\n$todos');
        }

        emit(PostStateSuccess(todos: todos));
      }
    }).onError((error, stackTrece) {
      emit(PosStateError(error: error.toString()));
    });
  }
}
