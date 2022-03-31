void Variables(){
  // 变量 (https://dart.dev/samples#variables)
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter','Saturn','Uranus','Neptune'];
  var image = {
    'tags':['saturn'],
    'url':'//path/to/saturn.jpg'
  }; 

  //以下部分为：为确定程序没有错，输出各个变量以检查

  print("name:$name\nyear:$year\nantennaDiameter:$antennaDiameter\nflybyObjects:$flybyObjects\nimage:$image");
}

void main(){
  //变量
  Variables();
}