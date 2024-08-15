import 'package:flutter/material.dart';

class BasicInformation extends StatefulWidget {
  const BasicInformation({super.key});

  @override
  State<BasicInformation> createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _eduController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _hunController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: '电子油箱',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _eduController,
              decoration: const InputDecoration(
                labelText: 'xuli',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _hunController,
              decoration: const InputDecoration(
                labelText: 'xuli',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
