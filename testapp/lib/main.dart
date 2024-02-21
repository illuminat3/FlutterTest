import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set the default and minimum size for the app window
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final window = WidgetsBinding.instance.window;
      window.onMetricsChanged = () {};
      window.onMetricsChanged!();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 10),
                const Text("Connected"),
                const SizedBox(width: 5),
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 5),
                const Text("example@gmail.com"),
                const Expanded(child: SizedBox()),
                FilledButton(
                    onPressed: () => {}, child: const Text("Disconnect"))
              ],
            ),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Red'),
                Tab(text: 'Green'),
                Tab(
                    child: Row(
                  children: [Text("Settings"), Icon(Icons.settings)],
                )),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable swiping
                children: [
                  // Pages with different background colors
                  RedPage(),
                  const GreenPage(),
                  const BluePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RedPage extends StatefulWidget {
  const RedPage({super.key});

  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  List<String> names = ["a", "b", "c"];

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("a"),
        Text("b"),
        Text("c"),
      ],
    );
  }
}

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.green);
  }
}

class BluePage extends StatelessWidget {
  const BluePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.blue);
  }
}
