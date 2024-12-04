import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tee_bay_app/core/app_theme/cubits/theme_cubit.dart';
import 'package:tee_bay_app/core/app_theme/cubits/theme_state.dart';
import 'package:tee_bay_app/core/app_theme/repository/theme_repository.dart';

import 'core/data/local_storage/storage_service.dart';
import 'features/auth/views/login_screen.dart';
import 'features/create_product/view_models/cubits/progress_cubit.dart';
import 'features/create_product/view_models/services/form_list.dart';

void main() async {
  await StorageService.init();
  final themeRepository = ThemeRepository(GetStorage());

  runApp(MyApp(
    themeRepository: themeRepository,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeRepository themeRepository;

  MyApp({super.key, required this.themeRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(themeRepository),
          ),
          BlocProvider(
              create: (context) => ProgressCubit(totalSteps: fromSteps.length)),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: state.themeData,
              home: LogInScreen(),
            );
          },
        ));
  }
}
