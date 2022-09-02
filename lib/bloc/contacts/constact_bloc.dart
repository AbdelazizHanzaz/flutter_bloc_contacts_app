
import 'package:bloc/bloc.dart';
import 'package:bloc_contact_app/bloc/contacts/contacts_evet.dart';
import 'package:bloc_contact_app/bloc/contacts/contacts_state.dart';
import 'package:bloc_contact_app/repository/contact.repo.dart';

class AllContactsBloc extends Bloc<ContactsEvents, ContactsStates>{

   AllContactsBloc({required this.contactRepo}):super(const ContactsStates()){
      on<ContactsEventLoading>(_mapContactsEventToState);
   }


   final ContactRepo contactRepo;
   
  Future<void> _mapContactsEventToState(ContactsEventLoading event, Emitter<ContactsStates> emit) async{
      try {
        emit(state.copyWith(status: ContactsStatus.leaoding));
        final contacts = await contactRepo.getContacts();
        emit(state.copyWith(status: ContactsStatus.success, contacts: contacts));
      } catch (e) {
        emit(state.copyWith(status: ContactsStatus.error));
      }
  }


}