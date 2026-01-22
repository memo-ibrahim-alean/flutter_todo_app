import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/task_input.dart';
import 'package:todo_app/widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController inputTextController = TextEditingController();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasksFromHive();
  }

  void loadTasksFromHive() {
    final taskBox = Hive.box('tasksBox');
    setState(() {
      tasks = taskBox.values.map((task) {
        final Map taskMap = task as Map;
        return Task(
          name: taskMap['name'] as String,
          isCompleted: taskMap['isCompleted'] as bool,
        );
      }).toList();
    });
  }

  void addTask(String taskName) {
    final taskBox = Hive.box('tasksBox');
    final newTask = Task(name: taskName, isCompleted: false);
    taskBox.add({'name': newTask.name, 'isCompleted': newTask.isCompleted});
    setState(() {
      tasks.add(newTask);
    });
  }

  void removeTask(int index) {
    final taskBox = Hive.box('tasksBox');
    taskBox.deleteAt(index);
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    final taskBox = Hive.box('tasksBox');
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
      taskBox.putAt(index, {
        'name': tasks[index].name,
        'isCompleted': tasks[index].isCompleted,
      });
    });
  }

  @override
  void dispose() {
    inputTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1768d7),
        title: const Text(
          'My Tasks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TaskInput(
              inputTextController: inputTextController,
              onAddTask: addTask,
            ),
            SizedBox(height: 20),
            Expanded(
              child: TaskList(
                tasks: tasks,
                total: tasks.length,
                onRemoveTask: removeTask,
                onToggleTask: toggleTask,
              ),
            ), // Body content goes here
          ],
        ),
      ),
    );
  }
}
