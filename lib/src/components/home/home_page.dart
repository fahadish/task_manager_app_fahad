import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app_fahad/src/models/task_model/task_model.dart';
import '../../provider/Task_provider/task_provider.dart';
import '../../provider/auth_provider/auth_provider.dart';
import '../../widget/app_text_field.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          final tasks = taskProvider.tasks;
          return tasks.isEmpty
              ? const Center(
            child: Text(
              'No tasks found',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
              : ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: task.completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                leading: Checkbox(
                  value: task.completed,
                  onChanged: (value) {
                    taskProvider.updateTask(task.copyWith(completed: value));
                  },
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    taskProvider.deleteTask(task.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: const Text('Add Task'),
          content: AppTextField(
            controller: controller,
            hint: 'Enter task name',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String taskTitle = controller.text.trim();
                if (taskTitle.isNotEmpty) {
                  final Task newTask = Task(id: DateTime.now().millisecondsSinceEpoch, title: taskTitle);
                  Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
