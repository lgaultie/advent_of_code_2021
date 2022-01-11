import 'dart:io';

void main(List<String> args) {
  if (args.length != 1) {
    print('Please give 1 file as an input');
    exit(0);
  }
  File file = File(args[0]);
  var contents = file.readAsLinesSync();
  var horizontal = 0;
  var depth = 0;
  for (var elem in contents) {
    if (elem.contains(' ')) {
      var instruction = elem.split(' ')[0];
      var number = int.parse(elem.split(' ')[1]);
      if (instruction == 'forward') {
        horizontal += number;
      } else if (instruction == 'up') {
        depth -= number;
      } else if (instruction == 'down') {
        depth += number;
      }
    }
  }
  print(horizontal * depth);
}
