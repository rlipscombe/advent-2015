import 'dart:io';

void main(List<String> arguments) {
  const int width = 1000;
  const int height = 1000;
  var lights = List.generate(width, (int index) => List.filled(height, 0));

  final re = RegExp(r'^([^0-9]+) ([0-9]+),([0-9]+) through ([0-9]+),([0-9]+)$');
  for (;;) {
    var line = stdin.readLineSync();
    if (line == null) break;
    if (line.isEmpty) continue;
    final match = re.firstMatch(line);
    if (match == null) continue;

    final action = match.group(1);
    final x0 = int.parse(match.group(2)!);
    final y0 = int.parse(match.group(3)!);
    final x1 = int.parse(match.group(4)!);
    final y1 = int.parse(match.group(5)!);

    print("$action $x0 $y0 $x1 $y1");
    switch (action) {
      case "turn on":
        for (var x = x0; x <= x1; ++x) {
          for (var y = y0; y <= y1; ++y) {
            lights[x][y]++;
          }
        }
        break;
      case "turn off":
        for (var x = x0; x <= x1; ++x) {
          for (var y = y0; y <= y1; ++y) {
            var val = lights[x][y];
            val--;
            if (val >= 0) lights[x][y] = val;
          }
        }
        break;
      case "toggle":
        for (var x = x0; x <= x1; ++x) {
          for (var y = y0; y <= y1; ++y) {
            var val = lights[x][y];
            val += 2;
            if (val >= 0) lights[x][y] = val;
          }
        }
        break;
      default:
        print("wat?");
    }
  }

  var brightness = 0;
  for (var x = 0; x < 1000; ++x) {
    for (var y = 0; y < 1000; ++y) {
      brightness += lights[x][y];
    }
  }

  print(brightness);
}
