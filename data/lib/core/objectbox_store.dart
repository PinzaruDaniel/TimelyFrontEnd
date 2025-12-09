
import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:data/modules/schedule/models/local/schedule_box.dart';
import 'package:data/modules/schedule/models/local/schedule_item_box.dart';
import 'package:objectbox/objectbox.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../objectbox.g.dart';

class ObjectBoxStore {
  late final Store _store;
  late final Box<HomeworkBox> homeworkBox;
  late final Box<ScheduleBox> scheduleBox;
  late final Box<ScheduleItemBox> scheduleItemBox;
  ObjectBoxStore._create(this._store){
    homeworkBox=Box<HomeworkBox>(_store);
    scheduleBox=Box<ScheduleBox>(_store);
    scheduleItemBox=Box<ScheduleItemBox>(_store);
  }
  static Future<ObjectBoxStore> create() async{
    final store=await openStore(
      directory: p.join((await getApplicationDocumentsDirectory()).path, 'timely_cache'),
      macosApplicationGroup: "timely.demo",
    );
    return ObjectBoxStore._create(store);

  }

}
