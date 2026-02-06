import 'package:flutter/material.dart';
import 'package:presentation/pages/homework_page/homework_page.dart';
import 'package:presentation/pages/schedule_page/schedule_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../resources/app_colors.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  bool heart = false;
  final controller = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final List<Widget> _pages = [
    const SchedulePage(),
    const HomeworkPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _pages,
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
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
            selectedIcon: Icon(Icons.person_rounded,),
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
        backgroundColor: Color(0xffeceff1),
        onTap: (index) {
          if (index == _currentIndex) return;
          controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Enter Details'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(hintText: "Name"),
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      String name = '_nameController.text';
                      String email = '_emailController.text';
                      Navigator.of(context).pop({'name': name, 'email': email});
                    },
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: AppColors.primaryCian,
        shape: const CircleBorder(),
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 42),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: const Center(child: Text('Chat Page', style: TextStyle(fontSize: 24))),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
    );
  }
}
