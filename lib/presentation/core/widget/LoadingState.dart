import 'package:flutter/material.dart';

class LoadingState extends StatefulWidget {
  const LoadingState({super.key});

  @override
  State<LoadingState> createState() => _CommonItemState();
}

class _CommonItemState extends State<LoadingState> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(height: 22),
          const Text(
            'Loading',
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      )
    );
  }

}