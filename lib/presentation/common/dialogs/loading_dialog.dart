import 'dart:async';

import 'package:flutter/material.dart';

VoidCallback showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: _LoadingTimer(),
      ),
    ),
  );

  return () => Navigator.of(context).pop();
}

class _LoadingTimer extends StatefulWidget {
  const _LoadingTimer({Key? key}) : super(key: key);

  @override
  _LoadingTimerState createState() => _LoadingTimerState();
}

class _LoadingTimerState extends State<_LoadingTimer> {
  late final Timer timer;
  int timerCount = 1;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timerCount++;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      timerCount.toString(),
      style:
          Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
    );
  }
}
