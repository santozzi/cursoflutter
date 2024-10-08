import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnomaybe/config/theme/app_theme.dart';
import 'package:yesnomaybe/presentation/providers/chat_provider.dart';
import 'package:yesnomaybe/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Material App',
        theme: AppTheme(selectedColor: 4).theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
