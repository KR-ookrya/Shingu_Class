import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MyHomePage(title: '플로터 홈 화면 입니다'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // 여기서 createBody2()로 바꾸면 다른 디자인으로 테스트 가능
        child: createBody5(),
      ),
    );
  }
}

// ✅ Container → Text 포함된 빨간 박스
Widget createBody1() {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    width: 200,
    height: 100,
    color: Colors.red,
    alignment: Alignment.center,
    child: const Text('Container'),
  );
}

// ✅ createBody2(): 그라데이션, 테두리 둥글기, 그림자 효과 포함된 박스
Widget createBody2() {
  return Container(
    padding: const EdgeInsets.only(left: 20, right: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          const Color.fromARGB(255, 255, 59, 98).withOpacity(0.7),
          const Color.fromARGB(255, 255, 59, 98),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 255, 59, 98).withOpacity(0.7),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    width: 200,
    height: 150,
    child: const Center(
      child: Text('Container', style: TextStyle(color: Colors.white)),
    ),
  );
}

Widget createBody3() {
  return Container(
    color: Colors.blue,
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        5,
        (index) => Container(
          width: 40,
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ),
  );
}

Widget createBody4() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      // 좌측 Expanded
      Expanded(
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),

      // 중간에 고정 너비 Container 4개
      ...List.generate(
        4,
        (index) => Container(
          width: 40,
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),

      // 우측 Expanded
      Expanded(
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ],
  );
}

Widget createBody5() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        flex: 1, // 첫 번째 영역 (비율 1)
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      Expanded(
        flex: 3, // 두 번째 영역 (비율 3)
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
      Expanded(
        flex: 2, // 세 번째 영역 (비율 2)
        child: Container(
          height: 40,
          color: Colors.red,
          margin: const EdgeInsets.all(5),
        ),
      ),
    ],
  );
}
