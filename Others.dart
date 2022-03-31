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

void main() {
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
}
