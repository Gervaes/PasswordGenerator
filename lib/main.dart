import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:password_generator/providers/config_provider.dart';
import 'package:password_generator/providers/password_provider.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends ConsumerWidget {
  Home({ Key? key }) : super(key: key);

  final passwordProvider = StateNotifierProvider<Password, String>((ref) {
    return Password();
  });

  final configProvider = StateNotifierProvider<Config,dynamic>((ref) {
    return Config();
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final password = ref.watch(passwordProvider);
    final configs = ref.watch(configProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              password,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            TextButton(
              child: Text("generate password"),
              onPressed: () {
                ref.read(passwordProvider.notifier).updatePassword(configs);
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Center(
          child:Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: configs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(configs[index]["description"]),
                      trailing: Checkbox(
                        value: configs[index]["active"],
                        onChanged: (value) {
                          ref.read(configProvider.notifier).toggleConfig(index);
                        },
                      ),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}