// my_app.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app_fahad/src/provider/Task_provider/task_provider.dart';
import 'package:task_manager_app_fahad/src/provider/auth_provider/auth_provider.dart';
import 'package:task_manager_app_fahad/src/utils/Local_Storage_Util.dart';
import 'components/auth/login_page.dart';
import 'components/home/home_page.dart';
import 'models/authModel/auth_model.dart';

class MyApp extends StatelessWidget {
  const MyApp._();

  static Future<void> initializeAndRun() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp._());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: LocalStorageUtil.loadUserData(),
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthProvider>(
              create: (context) => AuthProvider(),
            ),

            ChangeNotifierProvider<TaskProvider>(
              create: (context) => TaskProvider(),
            ),

          ],
          child: MaterialApp(
            theme: ThemeData.light(),
            title: 'Task',
            home: snapshot.hasData ? HomePage() : const LoginPage(),
          ),
        );
      },
    );
  }
}