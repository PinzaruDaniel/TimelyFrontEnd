import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/binding/root_bindings_controllers.dart';
import 'package:presentation/pages/auth/login_page/login_page.dart';
import 'package:presentation/util/resources/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  RootBindings().dependencies();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      child: GetMaterialApp(
        title: 'Timely',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.primaryCian,
            selectionColor: AppColors.primaryCian.withAlpha(50),
            selectionHandleColor: AppColors.primaryCian,
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
        // MainNavigationPage(),
      ),
    );
  }
}
