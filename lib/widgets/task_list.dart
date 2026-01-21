import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = [
      'Buy groceries',
      'Finish project',
      'Call mom',
      'Go to gym',
      'Read book',
    ];

    return Column(
      children: [
        const Text(
          'Tasks',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(value: false, onChanged: null),
                title: Text(tasks[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Total Tasks: 5 | Completed: 0',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
