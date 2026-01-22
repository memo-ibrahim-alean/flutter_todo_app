import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  const TaskInput({
    super.key,
    required this.inputTextController,
    required this.onAddTask,
  });

  final TextEditingController inputTextController;
  final Function(String) onAddTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: inputTextController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              hintText: 'Add a new task',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (inputTextController.text.isEmpty) {
                  SnackBar snackBar = SnackBar(
                    content: Text('you must enter a task name'),
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                onAddTask(inputTextController.text);
                inputTextController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1768d7),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Add Task'),
            ),
          ),
        ],
      ),
    );
  }
}
