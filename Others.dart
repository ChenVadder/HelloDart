//这是第五部分：导入
import 'dart:math';
import 'Spacecraft.class';

void Variables() {
  // 变量 (https://dart.dev/samples#variables)
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  //以下部分为：为确定程序没有错，输出各个变量以检查

  print(
      "name:$name\nyear:$year\nantennaDiameter:$antennaDiameter\nflybyObjects:$flybyObjects\nimage:$image");
}

void Control_flow_statements() {
  //控制流语句的学习 （https://dart.dev/samples#control-flow-statements）
  //本例中仍然沿用上一部分（即变量部分）的参数设定
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++)
    //在此，我想试一下“若只有一个语句，是否需要加花括号”
    print(month);

  while (year < 2016) {
    year += 1;
    //打印，以显示出执行过程
    print(year);
  }
}

void Functions() {
  //函数 （https://dart.dev/samples#functions）
  //在此，我希望能测试一下“是否可以在函数内部定义函数”
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
  //经过测试，发现可以在函数中定义函数

  var result = fibonacci(20);
  //打印以检查是否正常运行
  print(result);

  //测试匿名函数
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  flybyObjects.where((name) => name.contains('trun')).forEach(print);
}

//另一个匿名函数的实现方式，在main函数中调用
var a = () => print('hello in a');

void Comment() {
  //注释 （https://dart.dev/samples#comments）
  print('单行注释和多行注释的范式和C语言一致。\n三斜杠表示文档注释。');
  //既可以用双斜杠来单行注释。
  /*
  也可以用
  斜杠加星号的形式
  实现多行注释
  */
  //以下为文档注释的官方介绍
  /// This is a documentation comment, used to document libraries,
  /// classes, and their members. Tools like IDEs and dartdoc treat
  /// doc comments specially.
}

void Imports() {
  print("本部分的文档中介绍了导入库、包、文件的方法，但是由于目前还为有自己的包或文件，故仅导入一个math库，在文件最开始处。");
  print("另：以注释的形式介绍导入包或文件的范式。");
  /*
  Importing libraries from external packages:import 'package:test/test.dart';
  Importing files:                           import 'path/to/my_other_file.dart';
  */
}

void Classes() {
  //类 （https://dart.dev/samples#classes）
  var voyager = Spacecraft('Voyage I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  //尝试重载方法
  void describe() {
    print('Orbiter:$name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched:$launchYear($years years ago)');
    } else {
      print('Unlaunched');
    }
    print('altitude:$altitude');
  }
}

void Inheritance() {
  //拓展 （https://dart.dev/samples#inheritance)
  var Test = Orbiter('Test', DateTime(2022, 4, 3), 1234.56);
  Test.describe();
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts:$astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);

  void describe2() {
    print('Astronauts of PolotedCraft:$astronauts');
  }
}

void Minxin() {
  var Test2 = PilotedCraft("Test2", DateTime(2022, 4, 3));
  Test2.describe2();
  Test2.describeCrew();
}

void main() {
  //brew tap dart-lang/dart && brew install dart

  //变量
  print("——————第一部分：变量—————————————————————————");
  Variables();
  print("——————第二部分：控制流———————————————————————");
  Control_flow_statements();
  print("——————第三部分：函数—————————————————————————");
  Functions();
  print("——————另一种匿名函数的实现方式的测试——————————");
  a();
  print("——————把“函数”看作对象的测试—————————————————");
  //在Dart中，“函数”本身也是一个对象，可以实例化
  var b = Functions;
  b();
  print("——————第四部分：注释—————————————————————————");
  Comment();
  print("——————第五部分：导入—————————————————————————");
  Imports();
  print("——————第六部分：类———————————————————————————");
  Classes();
  print("——————第七部分：拓展—————————————————————————");
  Inheritance();
  print("——————第八部分：Minxin———————————————————————");
  Minxin();
}
