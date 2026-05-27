import 'dart:io';

import 'package:common/core/config/firebase_options.dart';
import 'package:di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/binding/root_bindings_controllers.dart';
import 'package:presentation/pages/auth/login_page/login_page.dart';
import 'package:presentation/pages/main_page/main_navigation_bar_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/view_models/user_profile_view_model.dart';

import 'controllers/controller_imports.dart';

bool _supportsFcm() {
  return !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> _initializeFirebaseMessaging() async {
  if (!_supportsFcm()) return;
  final messaging = FirebaseMessaging.instance;

  await messaging.setAutoInitEnabled(true);
  await messaging.requestPermission(alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {});

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
}

void main() async {
  bool isSessionExpired = false;
  WidgetsFlutterBinding.ensureInitialized();
  await initDi(
    onSessionExpired: () {
      isSessionExpired = true;
    },
  );
  RootBindings().dependencies();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (_supportsFcm()) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  await _initializeFirebaseMessaging();
  await userProfileController.getUser();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp(isSessionExpired: isSessionExpired));
  });
}

class MyApp extends StatelessWidget with LoginSignIn {
  final bool isSessionExpired;

  const MyApp({super.key, required this.isSessionExpired});

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
        home: entryPage(userProfileController.userViewModel.value, isSessionExpired),
        // MainNavigationPage(),
      ),
    );
  }
}

mixin LoginSignIn {
  Widget entryPage(UserProfileViewModel? userVM, bool isSessionExpired) {
    return isSessionExpired
        ? MainNavigationPage(isSessionExpired: isSessionExpired)
        : userVM != null
        ? MainNavigationPage()
        : LoginPage();
  }
}
