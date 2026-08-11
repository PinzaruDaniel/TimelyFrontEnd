import 'package:flutter/material.dart';
import 'package:flutter_liquid_glass_kit/flutter_liquid_glass_kit.dart';
import 'package:get/get.dart';
import 'package:keyboard_detection/keyboard_detection.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/pages/main_page/chat_page/chat_page.dart';
import 'package:presentation/pages/main_page/homework_page/homework_page.dart';
import 'package:presentation/pages/main_page/profile_page/profile_page.dart';
import 'package:presentation/pages/main_page/schedule_page/schedule_page.dart';
import 'package:presentation/util/base/base_app_dialog.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/routing/app_router.dart';
import 'package:smart_form_fields/smart_form_fields.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  static const _glassSettings = LiquidGlassSettings(
    tintColor: Colors.white,
    tintOpacity: 0.78,
    blurSigma: 24,
    androidBlurSigma: 8,
    borderOpacity: 0.65,
    shadowOpacity: 0.10,
    shadowBlurRadius: 18,
  );

  final PageController _pageController = PageController();
  final SmartFormKey _homeworkFormKey = SmartFormKey();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<HomeworkPageState> _homeworkPageKey =
      GlobalKey<HomeworkPageState>();
  late final List<Widget> _pages;
  int _currentIndex = 0;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _pages = [
      const SchedulePage(),
      HomeworkPage(key: _homeworkPageKey),
      const ChatPage(),
      const ProfilePage(),
    ];
    FocusManager.instance.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _subjectController.dispose();
    _descriptionController.dispose();
    FocusManager.instance.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    final primaryFocus = FocusManager.instance.primaryFocus;
    final hasFocus =
        primaryFocus != null &&
        primaryFocus is! FocusScopeNode &&
        primaryFocus.context != null;
    if (_isFocused != hasFocus && mounted) {
      setState(() => _isFocused = hasFocus);
    }
  }

  InputDecoration _fieldDecoration({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, color: AppColors.primaryCian),
      filled: true,
      fillColor: AppColors.background,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryCian, width: 1.5),
      ),
    );
  }

  Future<void> _showAddHomeworkDialog() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await AppRouter.showBaseDialog(
      context: context,
      barrierDismissible: true,
      dialog: BaseAppDialog(
        title: 'Add homework',
        titleIcon: Icons.auto_stories_rounded,
        confirmLabel: 'Add homework',
        content: SmartForm(
          key: _homeworkFormKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          errorAnimation: SmartErrorAnimation.slide,
          children: [
            SmartTextField(
              name: 'subject',
              controller: _subjectController,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              validators: [
                SmartValidators.required(message: 'Add a subject.'),
                SmartValidators.minLength(
                  2,
                  message: 'Use at least 2 characters.',
                ),
              ],
              decoration: _fieldDecoration(
                label: 'Subject',
                hint: 'Maths, chemistry, history…',
                icon: Icons.school_rounded,
              ),
            ),
            const SizedBox(height: 14),
            SmartDateField(
              name: 'dueDate',
              required: true,
              requiredMessage: 'Choose a due date.',
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
              decoration: _fieldDecoration(
                label: 'Due date',
                hint: 'Choose date',
                icon: Icons.event_rounded,
              ),
            ),
            const SizedBox(height: 14),
            SmartTextField(
              name: 'description',
              controller: _descriptionController,
              minLines: 3,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              validators: [
                SmartValidators.required(message: 'Add homework details.'),
              ],
              decoration: _fieldDecoration(
                label: 'Details',
                hint: 'Exercises, pages, notes…',
                icon: Icons.notes_rounded,
              ),
            ),
          ],
        ),
        onCancel: Get.back,
        onConfirm: () async {
          final result = await _homeworkFormKey.validate();
          if (!result.isValid) return;

          final dueDate = result.valueOf<DateTime>('dueDate')!;
          await mainAppController.addHomework(
            subject: result.text('subject').trim(),
            dueDate: dueDate.toIso8601String(),
            description: result.text('description').trim(),
          );

          _homeworkFormKey.reset();
          if (mounted) Get.back();
          _homeworkPageKey.currentState?.afterAddHomeworks();
        },
      ),
    );
  }

  void _selectPage(int index) {
    if (index == _currentIndex) return;
    FocusManager.instance.primaryFocus?.unfocus();
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDetection(
      controller: KeyboardDetectionController(
        onChanged: (value) {
          if (value == KeyboardState.hiding) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
      ),
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.background,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: _pages,
        ),
        bottomNavigationBar: _isFocused
            ? null
            : SafeArea(
                minimum: const EdgeInsets.fromLTRB(14, 8, 14, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Semantics(
                      label: 'Add homework',
                      button: true,
                      child: LiquidGlassButton(
                        settings: _glassSettings.copyWith(
                          tintColor: AppColors.primaryCian,
                          tintOpacity: 0.92,
                        ),
                        borderRadius: BorderRadius.circular(28),
                        padding: const EdgeInsets.all(17),
                        onPressed: _showAddHomeworkDialog,
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LiquidGlassNavBar(
                        settings: _glassSettings,
                        currentIndex: _currentIndex,
                        onTap: _selectPage,
                        height: 62,
                        activeColor: AppColors.primaryBlue,
                        inactiveColor: AppColors.textSecondary,
                        indicatorColor: AppColors.primaryBlue.withAlpha(26),
                        androidAnimationStyle:
                            LiquidGlassNavBarAnimationStyle.smooth,
                        items: const [
                          LiquidGlassNavItem(
                            icon: Icon(Icons.home_outlined),
                            activeIcon: Icon(Icons.home_rounded),
                            label: 'Home',
                            iosSystemImage: 'house',
                            iosSelectedSystemImage: 'house.fill',
                          ),
                          LiquidGlassNavItem(
                            icon: Icon(Icons.menu_book_outlined),
                            activeIcon: Icon(Icons.menu_book_rounded),
                            label: 'Work',
                            iosSystemImage: 'book.closed',
                            iosSelectedSystemImage: 'book.closed.fill',
                          ),
                          LiquidGlassNavItem(
                            icon: Icon(Icons.chat_bubble_outline_rounded),
                            activeIcon: Icon(Icons.chat_bubble_rounded),
                            label: 'Chat',
                            iosSystemImage: 'bubble.left',
                            iosSelectedSystemImage: 'bubble.left.fill',
                          ),
                          LiquidGlassNavItem(
                            icon: Icon(Icons.person_outline_rounded),
                            activeIcon: Icon(Icons.person_rounded),
                            label: 'Profile',
                            iosSystemImage: 'person',
                            iosSelectedSystemImage: 'person.fill',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
