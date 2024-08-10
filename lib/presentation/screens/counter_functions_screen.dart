import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;
  late String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              if(clickCounter == 0) return;
              setState(() {
                clickCounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCounter', 
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100),
            ),
            Text(
              clickCounter == 1 ? 'Click' : 'Clicks',
              style: const TextStyle(fontSize: 25)
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _CustomFloatingButton(
            icon: Icons.plus_one, 
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            }
          ),
          const SizedBox( height: 15 ),
          _CustomFloatingButton(
            icon: Icons.refresh_outlined,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox( height: 15 ),
          _CustomFloatingButton(
            icon: Icons.exposure_minus_1,
            onPressed: () {
              if(clickCounter == 0) return;
              setState(() {
                clickCounter--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _CustomFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const _CustomFloatingButton({ 
    required this.icon, 
    this.onPressed 
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // shape: const StadiumBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
