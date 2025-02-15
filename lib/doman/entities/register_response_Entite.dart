class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user,
    this.statusMessage,
      this.token,});


  String? message;
  UserEntity? user;
  String? token;
  String? statusMessage ;



}

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
      });


  String? name;
  String? email;

}