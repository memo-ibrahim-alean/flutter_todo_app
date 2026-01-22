import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;
  final int total;

  const TaskList({super.key, required this.tasks, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      // spreadRadius: 5,
                      blurRadius: 3,
                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Checkbox(value: false, onChanged: null),
                  title: Text(tasks[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Total Tasks: $total | Completed: 0',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
