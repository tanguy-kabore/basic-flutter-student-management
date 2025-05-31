class Student {

  String lastname;
  String firstname;
  String? comment;
  int? mark;

  Student({
    required this.lastname, 
    required this.firstname, 
    this.comment,
    this.mark
  });
}
