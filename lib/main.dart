import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/services/device_utils/file_picker/file_picker_cubit.dart';

import 'core/data/local_storage/storage_service.dart';
import 'features/auth/view_models/login_cubit/login_cubit.dart';
import 'features/auth/view_models/signup_cubit/signup_cubit.dart';
import 'features/auth/views/login_screen.dart';
import 'features/create_product/view_models/cubits/progress_cubit.dart';
import 'features/create_product/view_models/services/form_list.dart';
import 'features/home_screen/view_models/home_screen_cubit/home_screen_cubit.dart';
import 'features/my_cart/view_models/post_cubit/post_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocProvider(
              create: (context) => ProgressCubit(totalSteps: fromSteps.length)),
          BlocProvider(create: (context) => HomeScreenCubit()),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignupCubit()),
          BlocProvider(create: (context) => PostCubit()),
          BlocProvider(create: (context) => FilePickerCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LogInScreen(),
        ));
  }
}
