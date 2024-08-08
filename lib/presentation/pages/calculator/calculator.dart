import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(24.0)
                  ),
                  color: Theme.of(context).hoverColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              )
            ],
          );
        }
    );
  }

}