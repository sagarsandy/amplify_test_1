import 'package:flutter/material.dart';

class SignUpTab extends StatelessWidget {
  const SignUpTab({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(bottom: 16, left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIGN UP',
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 2,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: _TabLine(enabled: true)),
              const SizedBox(width: 5),
              Expanded(child: _TabLine(enabled: currentIndex == 1)),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabLine extends StatelessWidget {
  const _TabLine({Key? key, required this.enabled}) : super(key: key);

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: enabled ? 5 : 2,
      color: enabled ? Theme.of(context).colorScheme.primary : Colors.grey,
    );
  }
}
