void numbers_numbers_collections_strings_and_more() {
  //数字，集合，字符串等 (https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)

  print('#' * 40);
  print('\n Part1 数字、集合、字符串等');
  print('#' * 40);

  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(int.parse('42', radix: 16) == 66);

  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  assert(123.456.toStringAsFixed(2) == '123.46');
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  //经过测试，区间为前闭后开的集合
  assert('Never odd or even'.substring(6, 8) != 'odd');
  assert('Never odd or even'.substring(6, 9) == 'odd');

  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  //字符
  assert('Never odd or even'[0] == 'N');

  //for (final char in 'hello'.split(''))没看懂是如何实现的啊
  for (final char in 'hello'.split('')) {
    print(char);
  }
  //UTF16
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  //大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');

  assert('  hello  '.trim() == 'hello');
  //isEmpty是一个属性
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  //替换字符串
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  assert(greeting != greetingTemplate);

  var sb = StringBuffer();
  sb
    //write写入一个字符串，writeAll写入多个字符串
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  //这段代码等价于：
  //sb.write()
  //sb.writeAll()
  //sb.write()
  //第一个点代表sb。

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  //正则表达式，学得快，忘得也快
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
}

void Lists() {
  //列表  (https://dart.cn/guides/libraries/library-tour#collections)

  //<String>表示这个列表里只能装填String类型的元素
  var grains = <String>[];
  //只是创建了，还没有填元素，所以是空列表
  assert(grains.isEmpty);

  var fruits = ['apples', 'oranges'];
  //增加元素
  fruits.add('kiwis');
  //增加多个元素
  fruits.addAll(['grapes', 'bananas']);

  assert(fruits.length == 5);
  print(fruits);

  //查找元素，返回下标
  var appleIndex = fruits.indexOf('apples');
  //移除元素
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  //清空
  fruits.clear();
  assert(fruits.isEmpty);

  var vegetables = List.filled(99, 'broccoli');
  //查看是否生成成功
  assert(vegetables.length == 99);
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];
  //实现排序，字典排序
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  fruits = <String>[];
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
  //不可以添加除了String之外的元素
  // fruits.add(5);
}

void Sets() {
  //集合 (https://dart.cn/guides/libraries/library-tour#collections)

  //同样可以用泛型来指定元素类型
  var ingredients = <String>{};

  //增加元素
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  //集合元素有互异性，也就是说，如果增加一个已经存在的元素，是不会改变这个集合的
  ingredients.add('gold');
  assert(ingredients.length == 3);

  //删除元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  //生成集合
  var atomicNumbers = Set.from([79, 22, 54]);
  print("打印出来看看效果$atomicNumbers");
  assert(atomicNumbers.length == 3);

  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);

  //检查元素是否在集合内
  assert(ingredients.contains('titanium'));
  //同时检查多个元素
  assert(ingredients.containsAll(['titanium', 'xenon']));

  //求交集
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void Maps() {
  //map （https://dart.cn/guides/libraries/library-tour#collections）
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerms = Map();
  //可以规定键值的类型
  var nobleGases = Map<int, String>();
  nobleGases = {54: 'xenon'};
  assert(nobleGases[54] == 'xenon');
  //检查是否包含某个键
  assert(nobleGases.containsKey(54));

  //移除
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  //可取出所有的键或所有的值
  var keys = hawaiianBeaches.keys;
  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));
  print(keys);
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void main() {
  print('*' * 50);
  print('本次学习Dart的核心类库');
  print('*' * 50);

  print("——————第一部分：数字集合字符串—————————————————————————");
  numbers_numbers_collections_strings_and_more();
  print("——————第二部分：列表—————————————————————————");
  Lists();
  print("——————第三部分：集合—————————————————————————");
  Sets();
  print("——————第四部分：Map—————————————————————————");
  Maps();
}
