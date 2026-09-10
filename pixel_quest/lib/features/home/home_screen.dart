import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixel_quest/models/habit.dart';
import 'package:pixel_quest/models/check_in.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Quest'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Click the button to add a habit',
          ),
        ],
      ),
        
    );
  }

}