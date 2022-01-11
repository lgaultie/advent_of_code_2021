import 'dart:io';

void main(List<String> args) {
  if (args.length != 1) {
    print('Please give 1 file as an input');
    exit(0);
  }
  try{
    File file = File(args[0]);
    var contents = file.readAsLinesSync();
    var horizontal = 0;
    var depth = 0;
    var aim = 0;
    for (var elem in contents) {
      if (elem.contains(' ')) {
        var instruction = elem.split(' ')[0];
        var number = int.parse(elem.split(' ')[1]);
        if (instruction == 'forward') {
          horizontal += number;
          depth += aim * number;
        } else if (instruction == 'up') {
          aim -= number;
        } else if (instruction == 'down') {
          aim += number;
        }
      }
    }
    print(horizontal * depth);
  }
  catch (e) {
    print(e);
    exit(0);
  }
}
