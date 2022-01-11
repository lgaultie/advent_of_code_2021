import 'dart:io';

void checkArguments(List<String> arguments) {
  if (arguments.length != 1)
  {
    print('No file, or too much files in input');
    exit(0);
  }
}

void main(List<String> arguments) {
  checkArguments(arguments);
  try {
    File file = File(arguments[0]);
    List<String> lines = file.readAsLinesSync();
    List<int> numbers = [];
    for (var element in lines) {
      numbers.add(int.parse(element));
    }
    int increased = 0;
    for (int i = 0; i < numbers.length; i++) {
      if(i > 0 && numbers[i] > numbers[i-1]) {
        increased++;
      }
    }
    print(increased);
  }
  on FileSystemException {
    print('Could not read file');
    exit(0);
  }
  catch (e) {
    print(e);
    exit(0);
  }
}
