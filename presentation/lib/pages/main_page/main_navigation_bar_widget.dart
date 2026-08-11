import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:keyboard_detection/keyboard_detection.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/main_page/chat_page/chat_page.dart';
import 'package:presentation/pages/main_page/profile_page/profile_page.dart';
import 'package:presentation/pages/main_page/session_home_page/session_home_page.dart';
import 'package:presentation/util/base/base_app_dialog.dart';
import 'package:presentation/util/resources/texts_styles.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:presentation/util/widgets/due_date_row_widget.dart';
import 'package:presentation/util/widgets/text_form_field_widget.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../util/resources/app_colors.dart';
import 'homework_page/homework_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage>
    with WidgetsBindingObserver {
  final controller = PageController();
  int _currentIndex = 0;
  late final TextEditingController subjectController;
  late final TextEditingController descriptionController;
  final homeworkPageState = GlobalKey<HomeworkPageState>();
  bool _isFocused = false;
  String? dueDate;

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    FocusManager.instance.removeListener(_onFocusChange);

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    subjectController = TextEditingController();
    descriptionController = TextEditingController();
    FocusManager.instance.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    final hasFocus =
        primaryFocus != null &&
        primaryFocus is! FocusScopeNode &&
        primaryFocus.context != null;
    if (_isFocused != hasFocus) {
      setState(() => _isFocused = hasFocus);
    }
  }

  final List<Widget> _pages = [
    const SessionHomePage(),
    const HomeworkPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return KeyboardDetection(
      controller: KeyboardDetectionController(
        onChanged: (value) {
          if (value == .hiding) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
                FocusManager.instance.primaryFocus?.unfocus();
              });
            },
            children: _pages,
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: StylishBottomBar(
            items: [
              BottomBarItem(
                icon: const Icon(Icons.house_outlined),
                selectedIcon: const Icon(Icons.house_rounded),
                unSelectedColor: AppColors.grey,
                selectedColor: AppColors.primaryBlue,
                title: Text('Home'),
              ),
              BottomBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                selectedIcon: Icon(Icons.calendar_month),
                unSelectedColor: AppColors.grey,
                selectedColor: AppColors.primaryBlue,
                title: Text('Homework'),
              ),
              BottomBarItem(
                icon: Icon(Icons.chat_outlined),
                selectedIcon: Icon(Icons.chat_rounded),
                unSelectedColor: AppColors.grey,
                selectedColor: AppColors.primaryBlue,
                title: Text('Chat'),
              ),
              BottomBarItem(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person_rounded),
                unSelectedColor: AppColors.grey,
                selectedColor: AppColors.primaryBlue,
                title: Text('Profile'),
              ),
            ],
            option: AnimatedBarOptions(iconStyle: IconStyle.animated),
            currentIndex: _currentIndex,
            fabLocation: StylishBarFabLocation.center,
            hasNotch: true,
            notchStyle: NotchStyle.circle,
            backgroundColor: Colors.white,
            onTap: (index) {
              if (index == _currentIndex) return;
              controller.jumpToPage(index);
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        floatingActionButton: _isFocused || _currentIndex != 1
            ? null
            : FloatingActionButton(
                onPressed: () => AppRouter.showBaseDialog(
                  context: context,
                  barrierDismissible: true,
                  dialog: BaseAppDialog(
                    title: 'Add Homework',
                    titleIcon: Icons.edit_rounded,
                    content: Column(
                      children: [
                        8.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.school_rounded,
                              color: AppColors.primaryCian,
                            ),
                            4.horizontalSpace,
                            Text('Subject', style: TextsStyles.titleSmall),
                          ],
                        ),
                        4.verticalSpace,
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            hintText: 'ex: Maths, Info, Chimie',
                            controller: subjectController,
                          ),
                        ),
                        16.verticalSpace,
                        DueDateRowWidget(
                          onDateSelected: (value) {
                            dueDate = value.toString();
                          },
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.list_alt_rounded,
                              color: AppColors.primaryCian,
                            ),
                            4.horizontalSpace,
                            Text('Description', style: TextsStyles.titleSmall),
                          ],
                        ),
                        4.verticalSpace,
                        TextFormFieldWidget(
                          item: TextFieldViewItem(
                            hintText:
                                'ex: Exercise page 12, ex: Learn the lesson',
                            controller: descriptionController,
                            maxLines: 3,
                            minLines: 2,
                            keyboardType: .multiline,
                          ),
                        ),
                        /*HomeworkImagePickerWidget(
                          onImagePicked: (file) => _pickedImage = file,
                        ),*/
                      ],
                    ),
                    onCancel: () => Get.back(),
                    onConfirm: () async {
                      await mainAppController.addHomework(
                        subject: subjectController.text,
                        dueDate: dueDate ?? DateTime.now().toIso8601String(),
                        description: descriptionController.text,
                      );

                      Get.back();
                      homeworkPageState.currentState?.afterAddHomeworks();
                    },
                  ),
                ),
                backgroundColor: AppColors.primaryCian,
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 42,
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
