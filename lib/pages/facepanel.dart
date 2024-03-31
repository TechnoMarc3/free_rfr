import 'package:flutter/material.dart';
import 'package:free_rfr/pages/facepanels/keypad.dart';
import 'package:free_rfr/pages/facepanels/modifiers.dart';
import 'package:free_rfr/pages/facepanels/targets.dart';

import '../osc_control.dart';

class FacePanel extends StatefulWidget {
  final OSC osc;
  const FacePanel({required this.osc, super.key});

  @override
  State<FacePanel> createState() => _FacePanelState();
}

class _FacePanelState extends State<FacePanel> {
  final List<Widget> pages = const [Target(), Keypad(), AdditionalKeys()];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.isEmpty ? const CircularProgressIndicator() : pages[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.adjust), label: 'Targets'),
          BottomNavigationBarItem(icon: Icon(Icons.keyboard), label: 'Keypad'),
          BottomNavigationBarItem(
              icon: Icon(Icons.light_mode), label: 'Additional Keys'),
        ],
        onTap: (index) => setState(() => this.index = index),
        unselectedItemColor:
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.white
                : Colors.black,
        selectedItemColor: Colors.yellow,
        currentIndex: index,
      ),
    );
  }
}
