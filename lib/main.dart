import 'package:flutter/material.dart';
import 'package:yoboshu_mock_ui/features/guest_page/presentation/pages/guest_page.dart';
import 'dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GuestPage(),
    );
  }
}
