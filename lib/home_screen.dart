import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text = "Stop Service";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  FlutterBackgroundService().invoke("setAsBackground");
                },
                child: const Text("Background Service")),
            ElevatedButton(
                onPressed: () {
                  FlutterBackgroundService().invoke("setAsForeground");
                },
                child: const Text("Forground Service")),
            ElevatedButton(
                onPressed: () async {
                  final service = FlutterBackgroundService();
                  bool isRunning = await service.isRunning();
        
                  if (isRunning) {
                    service.invoke("stopService");
                  } else {
                    service.startService();
                  }
                  if (!isRunning) {
                    text = "Stop Service";
                  } else {
                    text = "Start Service";
                  }
                  setState(() {});
                },
                child: Text(text)),
          ],
        ),
      ),
    );
  }
}
