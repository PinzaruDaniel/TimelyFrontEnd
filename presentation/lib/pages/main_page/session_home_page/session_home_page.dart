import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/base/base_app_bar_widget.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/texts_styles.dart';
import 'package:presentation/util/widgets/main_circular_progress_indicator_widget.dart';

class SessionHomePage extends StatefulWidget {
  const SessionHomePage({super.key});

  @override
  State<SessionHomePage> createState() => _SessionHomePageState();
}

class _SessionHomePageState extends State<SessionHomePage> {
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadProfile());
  }

  Future<void> _loadProfile() async {
    if (_isRefreshing || !mounted) return;
    setState(() => _isRefreshing = true);
    await userProfileController.getUser();
    await userProfileController.getUser();
    await userProfileController.getUser();
    if (mounted) setState(() => _isRefreshing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBarWidget(title: 'Session Test', showBackIcon: false),
      body: Obx(() {
        final user = userProfileController.userViewModel.value;
        if (user == null) {
          return const Center(child: MainCircularProgressIndicatorWidget());
        }

        return RefreshIndicator(
          onRefresh: _loadProfile,
          color: AppColors.primaryCian,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.verified_user_rounded,
                size: 72,
                color: AppColors.primaryCian,
              ),
              const SizedBox(height: 24),
              Text(
                user.message.isNotEmpty
                    ? user.message
                    : 'You reached a protected endpoint',
                textAlign: TextAlign.center,
                style: TextsStyles.titleMedium,
              ),
              const SizedBox(height: 12),
              Text(
                user.email,
                textAlign: TextAlign.center,
                style: TextsStyles.bodyMedium,
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: _isRefreshing ? null : _loadProfile,
                icon: _isRefreshing
                    ? const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.refresh_rounded),
                label: const Text('Call /profile/'),
              ),
              const SizedBox(height: 12),
              Text(
                'When the access token expires, this protected request triggers the refresh flow and retries automatically.',
                textAlign: TextAlign.center,
                style: TextsStyles.bodySmall,
              ),
            ],
          ),
        );
      }),
    );
  }
}
