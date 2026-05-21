import 'package:get/get.dart';

class MainAppController extends GetxController{
  RxList<String> pendingIds = RxList([]);

  void addPendingIds(List<String> pendingIds) {
    this.pendingIds.addAll(pendingIds);
    this.pendingIds.refresh();
  }

  void removePendingIds(List<String> pendingIds) {
    this.pendingIds.removeWhere((item) => pendingIds.contains(item));
    this.pendingIds.refresh();
  }

}