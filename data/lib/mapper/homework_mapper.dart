import 'package:data/modules/homework/models/local/homework_box.dart';
import 'package:data/modules/homework/models/remote/index.dart';
import 'package:domain/modules/homework/models/index.dart';
import 'package:smart_mapper/smart_mapper.dart';

part 'homework_mapper.g.dart';

@SmartMapper()
abstract class HomeworkMapper {
  HomeworkEntity fromRemote(HomeworkApiDto source);

  HomeworkBox toLocal(HomeworkEntity source);

  HomeworkEntity fromLocal(HomeworkBox source);
}

final _homeworkMapper = createHomeworkMapper();

extension HomeworkToEntityMapper on HomeworkApiDto {
  HomeworkEntity get toEntity => _homeworkMapper.fromRemote(this);
}

extension HomeworkToBoxMapper on HomeworkEntity {
  HomeworkBox get toBox => _homeworkMapper.toLocal(this);
}

extension HomeworkBoxToEntityMapper on HomeworkBox {
  HomeworkEntity get toEntity => _homeworkMapper.fromLocal(this);
}
