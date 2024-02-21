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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the default and minimum size for the app window
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final window = WidgetsBinding.instance.window;
      window.onMetricsChanged = () {};
      window.onMetricsChanged!();
    });

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Demo'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Red'),
              Tab(text: 'Green'),
              Tab(text: 'Blue'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(), // Disable swiping
          children: [
            // Pages with different background colors
            RedPage(),
            GreenPage(),
            BluePage(),
          ],
        ),
      ),
    );
  }
}

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.red);
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
