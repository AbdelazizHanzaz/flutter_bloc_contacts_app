import 'package:bloc_contact_app/ui/widgets/contact_form.dart';
import 'package:flutter/material.dart';


class AddContactScreen extends StatelessWidget {
  final String? title;
  const AddContactScreen({ Key? key, this.title }) : super(key: key);

  static const routeName = "/add_contact";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: const ContactForm(),
    );
  }
}