import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador de Bryan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF007F78),
        ),
        scaffoldBackgroundColor: const Color(0xFFF0F7F7),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Contador de Bryan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _mostrarMensaje() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          icon: const Icon(
            Icons.celebration,
            color: Color(0xFF007F78),
            size: 40,
          ),
          title: const Text('¡Hola, bienvenido!'),
          content: Text(
            'Esta aplicación fue personalizada por Bryan.\n\n'
            'Tu contador actualmente tiene el valor $_counter.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Entendido'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17324D),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.touch_app,
                  size: 72,
                  color: Color(0xFF007F78),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Cada toque cuenta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF17324D),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Presiona “Sumar” para aumentar el contador.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 28),
                const Text(
                  'TOQUES REGISTRADOS',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2,
                    color: Color(0xFF17324D),
                  ),
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF007F78),
                  ),
                ),
                const SizedBox(height: 28),
                ElevatedButton.icon(
                  onPressed: _mostrarMensaje,
                  icon: const Icon(Icons.message_outlined),
                  label: const Text('Ver mensaje'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17324D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Aumentar el contador',
        backgroundColor: const Color(0xFF007F78),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Sumar'),
      ),
    );
  }
}