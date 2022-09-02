

import 'package:bloc/bloc.dart';
import 'package:bloc_contact_app/model/contact.model.dart';
import 'package:bloc_contact_app/repository/contact.repo.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState>{

  final ContactRepo contactRepo;

  ContactsBloc({required ContactsState initState, required this.contactRepo}):super(initState){
    on<LoadAllContactsEvent>((event, emit) => _mapContactsEventToState(event, emit));
  }
   
  

  void _mapContactsEventToState(LoadAllContactsEvent event, Emitter<ContactsState> emit) async{
      try {
        emit(ContactsState(requestState: RequestState.loading));
        final contacts = await contactRepo.getContacts();
        emit(ContactsState(contacts: contacts, requestState: RequestState.loaded));
      } catch (e) {
        emit(ContactsState(requestState: RequestState.error, errorMessage: e.toString()));
      }
           
  }


  Stream<ContactsState> mapEventToState(ContactsEvent contactsEvent) async*{
    if(contactsEvent is LoadAllContactsEvent) {
      yield ContactsState(
          contacts: state.contacts, requestState: RequestState.loading);
      try{
         //List<Contact> data = await ContactRepo.getContacts();
         yield ContactsState(contacts: state.contacts, requestState: RequestState.loaded);
      }catch(e){
        yield ContactsState(contacts: state.contacts, requestState: RequestState.error, errorMessage: e.toString());

      }

      
    }

  }
}

abstract class ContactsEvent{}

class ContactsState{
  List<Contact>? contacts;

  RequestState? requestState;

  String? errorMessage;

  ContactsState({this.contacts, this.requestState, this.errorMessage});

  
}
class LoadAllContactsEvent extends ContactsEvent{}

class LoadDeveloperEvent extends ContactsEvent{}

class LoadStudentsEvent extends ContactsEvent{}


enum RequestState{
   loading, loaded, error, none
}

extension RequestStateX on RequestState{

  bool get isNone => this == RequestState.none;
  bool get isLoading => this == RequestState.loading;
  bool get isLoaded => this == RequestState.loaded;
  bool get isError => this == RequestState.error;

}
