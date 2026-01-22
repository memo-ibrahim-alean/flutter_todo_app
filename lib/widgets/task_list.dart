import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final int total;
  final Function(int)? onRemoveTask;
  final Function(int)? onToggleTask;

  const TaskList({
    super.key,
    required this.tasks,
    required this.total,
    this.onRemoveTask,
    this.onToggleTask,
  });

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
                  leading: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (value) {
                      if (onToggleTask != null) {
                        onToggleTask!(index);
                      }
                    },
                  ),
                  title: Text(tasks[index].name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      if (onRemoveTask != null) {
                        onRemoveTask!(index);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Total Tasks: $total | Completed: ${tasks.where((task) => task.isCompleted).length}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
