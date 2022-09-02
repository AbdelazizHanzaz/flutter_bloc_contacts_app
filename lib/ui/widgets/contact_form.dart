import 'dart:developer';

import 'package:bloc_contact_app/model/contact_type.dart';
import 'package:bloc_contact_app/repository/contact.repo.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final types = ContactRepo.contactsType;
    TypeContact _typeContact = types.elementAt(0);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButtonFormField<TypeContact>(
              
              onChanged: (value) {
                _typeContact = value!;
                log(_typeContact.title!);
              },
              value: _typeContact,
              items: types.map((type){
                return DropdownMenuItem<TypeContact>(
                  value: type,
                  child: Text(type.title!)
                );
              }).toList()),
          ],
        ),
        
      ),
    );
  }
}