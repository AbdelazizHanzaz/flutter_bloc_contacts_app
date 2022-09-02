import 'package:bloc_contact_app/bloc/contacts/constact_bloc.dart';
import 'package:bloc_contact_app/bloc/contacts/contacts_evet.dart';
import 'package:bloc_contact_app/bloc/contacts/contacts_state.dart';
import 'package:bloc_contact_app/ui/widgets/list_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllContacts extends StatelessWidget {
  const AllContacts({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      //drawerEdgeDragWidth: double.infinity,
      drawerScrimColor: Colors.black38,
         appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<AllContactsBloc>().add(ContactsEventLoading());
              },
              icon: const Icon(Icons.list)),
          IconButton(
              onPressed: () {
                context.read<AllContactsBloc>().add(ContactsEventLoading());
              },
              icon: const Icon(Icons.refresh))
        ],
        title: Text(title),
      ),
      body: BlocBuilder<AllContactsBloc, ContactsStates>(
        builder: (context, state) {
          switch (state.status) {
            case ContactsStatus.leaoding:
              return const Center(child: CircularProgressIndicator());
            case ContactsStatus.success:
              return ContactsListView(contacts: state.contacts!);
            case ContactsStatus.error:
              return const Center(
                child: Icon(Icons.error),
              );
            default:
              return const Center(
                child: Icon(Icons.hourglass_empty),
              );
          }
        },
      ),
    );
  }
}
