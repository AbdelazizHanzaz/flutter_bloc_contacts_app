
import 'package:bloc_contact_app/bloc/blocs.dart';
import 'package:bloc_contact_app/model/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactsListView extends StatelessWidget {
  final List<Contact> contacts;
  const ContactsListView({ Key? key,required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => BlocProvider.of<ContactsBloc>(context, listen: false).add(LoadAllContactsEvent()),
      child: ListView.builder(
        itemBuilder: (context, index){
          final contact = contacts[index];
          return Card(
             child: ListTile(
              leading: CircleAvatar(
                child: Text(contact.profile!),
              ),
              title: Text(contact.name!),
              subtitle: Text(contact.contactType.toString()),
              trailing: Text("${contact.score}"),
    
             ),
          );
        },
        itemCount: contacts.length),
    );
  }

  Widget buildAds(BuildContext context){
    return const Card(
      color: Colors.green,
      child: Text(""),
    );
  }
}