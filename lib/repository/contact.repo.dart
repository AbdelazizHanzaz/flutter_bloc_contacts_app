

import 'dart:math';

import 'package:bloc_contact_app/model/contact.model.dart';
import 'package:bloc_contact_app/model/contact_type.dart';

class ContactRepo{

  final Map<int, Contact> _contactsMap = {
      1 : Contact(id: 1, name: "abdelaziz hanzaz", profile: "AH", contactType: ContactType.student, score: 10),
      2 : Contact(id: 2, name: "Nassim Avito", profile: "NA", contactType: ContactType.developer, score: 15),
      3 : Contact(id: 3, name: "Khalil Nizar", profile: "KN", contactType: ContactType.student, score: 18),
      4 : Contact(id: 4, name: "Halima Naji", profile: "HN", contactType: ContactType.developer, score: 20),
      5 : Contact(id: 5, name: "Smail Algazouli", profile: "SA", contactType: ContactType.student, score: 16),
  };

   
   static final List<TypeContact> contactsType = [
         TypeContact(id: 1, title: "Student"),
         TypeContact(id: 2, title: "Developer" ),
         TypeContact(id: 3, title: "Manager" ),
         TypeContact(id: 4, title: "Director" ),
         TypeContact(id: 5, title: "Teacher" ),
   ];



  Future<List<Contact>> getContacts() async{

     await Future.delayed(const Duration(milliseconds: 600));

    int codeStatus = Random().nextInt(10);

    if(codeStatus < 1){
        throw(Exception("Problem internet please try again!!!")); 
    }
    return _contactsMap.values.toList();     
  }

  Future<List<Contact>> getContactsByType(ContactType type) async{
     await Future.delayed(const Duration(seconds: 5));

    int codeStatus = Random().nextInt(10);

    if(codeStatus < 2){
        throw(Exception("Problem internet please try again!!!")); 
    }
    return _contactsMap.values.where((e) => e.contactType == type).toList();

  }



}