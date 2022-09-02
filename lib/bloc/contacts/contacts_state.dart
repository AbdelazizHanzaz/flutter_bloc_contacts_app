
import 'package:bloc_contact_app/model/contact.model.dart';

enum ContactsStatus{initial, success, error, leaoding}
 
extension ContactsStatusX on ContactsStatus{
  bool get isInitial => this == ContactsStatus.initial;
  bool get isLoading => this == ContactsStatus.leaoding;
  bool get isError => this == ContactsStatus.error;
  bool get isSuccess => this == ContactsStatus.success;
}

class ContactsStates{

   const ContactsStates({
    this.status = ContactsStatus.initial,
    this.contacts
   });

     final List<Contact>? contacts;
     final ContactsStatus status;

    ContactsStates copyWith({
            ContactsStatus? status,
            List<Contact>? contacts
    }){
         return ContactsStates(
                status: status ?? this.status,
                contacts: contacts ?? this.contacts
         );
    }

}