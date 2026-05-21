import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/controller_imports.dart';
import '../widgets/loading_overlay_widget.dart';

class BasePage extends StatefulWidget {
  final WidgetBuilder builder;
  final PreferredSizeWidget? appBar;
  final bool extendBody;
  final bool? resizeToAvoidBottomInset;
  final Key? keyPage;
  final List<String>? pendingIds;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final double? drawerEdgeDragWidth;

  const BasePage({
    super.key,
    required this.builder,
    this.pendingIds,
    this.resizeToAvoidBottomInset,
    this.appBar,
    this.extendBody = false,
    this.keyPage,
    this.drawer,
    this.bottomNavigationBar,
    this.drawerEdgeDragWidth,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      extendBody: widget.extendBody,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawer: widget.drawer,
      appBar: widget.appBar,
      key: widget.keyPage,
      body: SafeArea(
        child: Obx(
              () => Stack(
            children: [
              widget.builder(context),
              if (widget.pendingIds!.any((e) => mainAppController.pendingIds.contains(e))) LoadingOverlayWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
