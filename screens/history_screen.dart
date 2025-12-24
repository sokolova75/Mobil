import 'package:flutter/material.dart';
import '../models/day_steps.dart';

class HistoryScreen extends StatelessWidget {
  final List<DaySteps> history;

  const HistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('История')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(history[i].date),
          trailing: Text('${history[i].steps} шагов'),
        ),
      ),
    );
  }
}