import 'package:bloc_contact_app/bloc/blocs.dart';
import 'package:bloc_contact_app/repository/contact.repo.dart';
import 'package:bloc_contact_app/ui/screens/screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ContactsBloc(initState: ContactsState(contacts: [], requestState: RequestState.none, errorMessage: ""), contactRepo: ContactRepo())),
        BlocProvider(create: (context) => AllContactsBloc(contactRepo: ContactRepo())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        
        routes: {
          "/" : (context) => const HomeScreen(title : "Home"),
          ContactScreen.routeName : (context) => const ContactScreen(title: "All Contacts"),
          AddContactScreen.routeName : (context) => const AddContactScreen(title: "New Contact"),
          CounterScreen.routeName : (context) => const CounterScreen(title: 'Counter'),
          SettingScreen.routeName : (context) =>  const SettingScreen(title: "Settings")
        },
        initialRoute: "/",
      ),
    );
  }
}

