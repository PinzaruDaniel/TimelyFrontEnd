void consoleLog(dynamic data) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(data.toString()).forEach((match) => print(match.group(0)));
}
