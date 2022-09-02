import 'package:bloc_contact_app/bloc/contacts/contact.bloc.dart';
import 'package:bloc_contact_app/ui/screens/screens.dart';
import 'package:bloc_contact_app/ui/widgets/list_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactScreen extends StatelessWidget {
  final String? title;
  const ContactScreen({Key? key, this.title}) : super(key: key);

  static const routeName = "/contacts";

  
  @override
  Widget build(BuildContext context) {
       
    BlocProvider.of<ContactsBloc>(context, listen: false).add(LoadAllContactsEvent());

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
          actions: [
            IconButton(
              onPressed: () {
                  context.read<ContactsBloc>().add(LoadAllContactsEvent());
                },
              icon: const Icon(Icons.refresh))
          ],
        ),
        body: BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              if(state.requestState == RequestState.loading){
                return _centerWidgets(child: const CircularProgressIndicator());
              }
              if(state.requestState == RequestState.loaded){
                return ContactsListView(contacts: state.contacts!);
              }
              if(state.requestState == RequestState.error){
                return _centerWidgets(child: Text(state.errorMessage!));
              }
              return _centerWidgets(child: const Text("Load Contacts"));
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed(AddContactScreen.routeName);
          },
          child: const Icon(Icons.add),

        ),
        
        
        );
        
  
  }

  Widget _centerWidgets({required Widget? child}) => Center(child: child,);

}
