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

void main() {
  //变量
  Variables();
  print("————————————————————————————————————————————");
  Control_flow_statements();
}
