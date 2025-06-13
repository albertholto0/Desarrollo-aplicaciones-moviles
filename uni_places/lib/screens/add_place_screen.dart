import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _nameController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar nuevo lugar"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Nombre: "),
              controller: _nameController,
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text("Agregar"),
              icon: Icon(Icons.add_photo_alternate_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
