import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _offset = const Offset(200, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  left: _offset.dx,
                  top: _offset.dy,
                  child: LongPressDraggable(
                    feedback: Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                    child: Container(
                      color: Colors.blue,
                      width: 100,
                      height: 100,
                    ),
                    onDragEnd: (details) {
                      setState(() {
                        double adjustment = MediaQuery.of(context).size.height - constraints.maxHeight;
                        _offset = Offset(details.offset.dx, details.offset.dy - adjustment);
                      });
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
