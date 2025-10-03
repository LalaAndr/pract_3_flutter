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
      home: HomePage(),
    );
  }
}

// StatefulWidget – главный экран с переключением контента и темой
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _darkMode = false; // состояние темы

  List<Widget> get _pages => [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(
      darkMode: _darkMode,
      onToggleTheme: () {
        setState(() {
          _darkMode = !_darkMode;
        });
      },
    ),
    AboutScreen(),
    ContactsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text("Практическая работа №3")),
        body: Center(child: _pages[_currentIndex]),
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
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueAccent, width: 2),
          ),
          child: Column(
            children: [
              Icon(Icons.person, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text("Имя пользователя: Андрусенко Лада",
                  style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
              Text("Статус: Онлайн",
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            ],
          ),
        ),
      ],
    );
  }
}

// Экран 3 – кнопка для смены темы
class SettingsScreen extends StatelessWidget {
  final bool darkMode;
  final VoidCallback onToggleTheme;

  SettingsScreen({required this.darkMode, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onToggleTheme,
        child: Text(
          darkMode ? "Переключить на светлую тему" : "Переключить на тёмную тему",
          textAlign: TextAlign.center,
        ),
      ),
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
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.email, color: Colors.blue),
            SizedBox(width: 10),
            Text("support@edu.mirea.ru", style: TextStyle(fontSize: 16)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.phone, color: Colors.green),
            SizedBox(width: 10),
            Text("+7 (999) 123-45-67", style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
