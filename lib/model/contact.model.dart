

enum ContactType{
   student, developer, 
   
}



class Contact{

  final int? id;
  final String? name;
  final String? profile;
  final int score;
  final ContactType? contactType;

  Contact({this.id, this.name, this.profile, this.contactType, this.score = 0});

  //static final empty = Contact();

}