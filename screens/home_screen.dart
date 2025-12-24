import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/day_steps.dart';
import '../storage/steps_storage.dart';
import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int stepsToday = 0;
  List<DaySteps> history = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    history = await StepsStorage.load();
    setState(() {});
  }

  Future<void> saveHistory() async {
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    history.add(DaySteps(date: date, steps: stepsToday));
    await StepsStorage.save(history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryScreen(history: history),
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          '$stepsToday шагов',
          style: const TextStyle(fontSize: 28),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          stepsToday++;
          setState(() {});
        },
      ),
    );
  }
}