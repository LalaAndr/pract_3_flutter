import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// StatelessWidget – корневой виджет
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Практическая работа №3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// StatefulWidget – главный экран с переключением контента
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // список экранов
  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
    AboutScreen(),
    ContactsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Практическая работа №3")),
      body: Center(child: _pages[_currentIndex]), // весь контент по центру
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Дом"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Настройки"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "О приложении"),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label: "Контакты"),
        ],
      ),
    );
  }
}

// Экран 1
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Добро пожаловать в приложение!",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

// Экран 2
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 80, color: Colors.blue),
        SizedBox(height: 20),
        Text("Имя пользователя: Андрусенко Лада",
            style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        Text("Статус: Онлайн",
            style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
      ],
    );
  }
}

// Экран 3
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Темная тема", textAlign: TextAlign.center),
      value: _darkMode,
      onChanged: (value) {
        setState(() {
          _darkMode = value;
        });
      },
    );
  }
}

// Экран 4
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Это учебное приложение, созданное для демонстрации работы с виджетами Flutter.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Экран 5
class ContactsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Связаться с нами:", style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
        SizedBox(height: 10),
        Text("Email: support@edu.mirea.ru", textAlign: TextAlign.center),
        Text("Телефон: +7 (999) 123-45-67", textAlign: TextAlign.center),
      ],
    );
  }
}
