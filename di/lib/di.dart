
import 'package:di/data_injection_container.dart';
import 'package:di/domain_injection_container.dart';

Future<void> initDi() async{
  await intiData();
  await initDomain();
}