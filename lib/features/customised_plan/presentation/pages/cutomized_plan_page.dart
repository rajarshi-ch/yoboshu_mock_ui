import 'package:flutter/material.dart';

class CustomizedPlanPage extends StatelessWidget {
  const CustomizedPlanPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CustomizedPlanPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Some Text",
            ),
            Text(
              'Hi',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Customize My Plan',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
