import 'package:flutter/material.dart';

import '../../messages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text(Messages.of(context)!.trips),
    );
  }
}
