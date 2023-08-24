import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SyncDataScreen extends StatelessWidget {
  const SyncDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sync Data',
          style: GoogleFonts.mulish(),
        ),
      ),
      body: const Center(child: Text('Sync Data Screen')),
    );
  }
}
