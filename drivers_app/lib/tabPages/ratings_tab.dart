import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RatingsTabPage extends StatefulWidget {
  const RatingsTabPage({super.key});

  @override
  State<RatingsTabPage> createState() => _RatingsPageState();
}

class _RatingsPageState extends State<RatingsTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page'));
  }
}
