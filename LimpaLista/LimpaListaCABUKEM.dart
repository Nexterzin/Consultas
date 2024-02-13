import 'package:flutter/material.dart';

class _LimpaListaCABUKEMState extends StatefulWidget {
  const _LimpaListaCABUKEMState({Key? key}) : super(key: key);

  @override
  State<_LimpaListaCABUKEMState> createState() =>
      __LimpaListaCABUKEMStateState();
}

class __LimpaListaCABUKEMStateState extends State<_LimpaListaCABUKEMState> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
