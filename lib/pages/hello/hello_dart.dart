import 'package:meta/meta.dart';

void main() {
  //一、变量
  //1，基本类型:int、double、bool
  //方式一：指定数据类型+变量名=>与java一样
  int a = 1;
  double b = 1.0;
  bool c = true;
  //方式二：var+变量名 => 直接赋值，flutter会根据类型自动判断
  var isCute = true;

  //常量修饰符：final：运行时常量  const：编译时常量
  //两种方式 final/const+常量名：直接修饰声明常量
  //       final/const + int/double/bool + 变量名：可修饰已经声明类型的变量
  final int e = 3;
  const bool d = true;
  final f = 1.2;
  const r = 1;
  //总结，final/const 可直接声明 或者 修饰某个变量；var只能用于声明变量，不可修饰已确定类型变量

  //2，string类型
  String h = "带类型的声明";
  var m = "不带类型的声明";
  var n = m.toLowerCase();
  //检测内容是否相同
  assert(m == n);
  print("检测内容是否相同：");
  //检测是否是同一个对象
  assert(identical(m, n));

  //3，集合
  //3.1，List
  //方式一：与java一样
  var list = List<int>();
  list.add(1);
  list.add(2);
  //方式二（推荐）：通过字面量创建对象，list 的泛型参数可以从变量定义推断出来。
  var list2 = ["1", "2", "4"];
  list2.add("3");
  //方式三：没有元素，显式指定泛型参数为 bool
  var list3 = <bool>[];
  list3.add(true);
  list3.add(false);
  //方式四：list6 指向的是一个常量，我们不能给它添加元素（不能修改它）
  var list6 = const [1, 2, 3, 4];
  //list6.add("1"); 错误的
  list6 = [4, 5]; // it's fine
  //方式五：同样是常量，不可添加
  const list4 = [1, 2, 34, 5];
  const list0 = const [1, 2, 34, 5];

  for (var e in list2) {
    print(e);
  }

  //3.2，Set,只能通过构造函数声明
  var set = Set<String>();
  set.add("dart是什么？");
  set.add("dart使用在那些场景");
  assert(set.contains("dart使用在那些场景"));

  //3.3，Map
  //创建
  var map = Map<String, bool>();
  var map2 = <String, String>{};
  map['1'] = true;
  map['2'] = false;
  map['3'] = false;
  //修改 对应key的值，直接赋值
  // (是否有方法可以动态获取到map的key，通过key再去改变值，这样更灵活些，靠记忆key去更改值不方便，不灵活)
  map["1"] = true;
  //判断
  if (map["22"] == null) {
    print("判断map中是否存在 22 key对应的值");
  }
  //声明为常量
  var map3 = const {"name": "贾娜娜", "age": "23", "sex": "女"};

  //4、接受任意类型对象 修饰符
  //TODO Object和dynamic 这两个应用场景是什么
  Object obj = '1';
  obj = 23;
  obj.toString();

  dynamic obj2 = <String, bool>{};
  obj2 = false;
  obj2 = "2";
  obj2 = 1;

  if (obj2 is Map<String, bool>) {
    obj2["1"] = true;
    print(obj2["1"]);
  }
  if (obj2 is List<int>) {
    obj2.add(1);
    for (var a in obj2) {
      print(a);
    }
  }

  //二、语句
  var flag = true;
  //条件语句 if else
  if (flag) {
    print("if true");
  } else {
    print("else false");
  }

  //循环语句 for 循环
  for (var i = 0; i < 10; i++) {
    print(i);
  }
  //do while
  var sum = 0;
  do {
    sum++;
  } while (sum > 5);
  //while
  while (sum < 0) {
    print("哈哈哈哈");
  }

  //选择语句 支持常量和枚举
  var s = "3";
  switch (s) {
    case "1":
      break;
    case "3":
      break;
  }

  //三、函数
  //1，无参
  int method() {
    return 0;
  }

  void method2() {}
  //2，有参
  //正常参数
  void method3(int x, int y) {}

  //可选参数 可传可不传 类似 重载构造函数：
  //使用 [] 符号包裹特定参数，可申明默认值[int y = 3]
  void method4(int x, [int y]) {}

  //具名参数:参数顺序任意，所有参数可选，使用 {} 符号包裹所有参数，同样可以申明默认值
  //比如 method5(y:5,x:6)，method5()这个调用是合法的，但它会导致 method5() 在运行时抛异常
  void method5({int x, int y}) {}
  void method6({@required int x, int y}) {}
  //TODO 思考 如果想要某个参数是必须的，那直接声明在外边不就完了，干嘛多此一举还弄个 @required
  //3, 函数可以在函数内部定义 TODO
  var adder = makeAdder(1);
  print(adder(1, 4));
}

// typedef 在 Dart 里面用于定义函数类型的别名
typedef Adder = int Function(int, int);

Adder makeAdder(int e) {
  int adder(int x, int y) {
    return x + y + e;
  }

  return adder;
}

//五 泛型
class Pair<S, T> {
  S first;
  T second;

  Pair(this.first, this.second);
}

//四、类
class _FirstClass {
  //如果不想某个变量对外部可见，可以添加下划线
  int _x; //
  int _y;

  int get x => _x;

  set x(int value) {
    _x = value;
  }

  int get y => _y;

  set y(int value) {
    _y = value;
  }
}

class First {
  int x;
  int y;

  First(int x, int y)
      : x = x,
        y = y {
    //初始化列表（initializer list）对对象进行初始化
  }

//推荐方式
//First(this.x, this.y);

//普通方式
//  First(int x, int y) {
//    this.x = x;
//    this.y = y;
//  }
}
