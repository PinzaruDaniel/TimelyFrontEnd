import 'package:di/data/api_service_injection_container.dart' as api_service;
import 'package:di/data/local_source_injection_container.dart' as local_source;
import 'package:di/data/repo_injection_container.dart' as repositories;

Future<void> intiData() async {
  api_service.init();
  local_source.init();
  repositories.init();
}
