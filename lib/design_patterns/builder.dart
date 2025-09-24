class User {
  final String? name;
  final String? email;
  final int? age;

  User({this.name, this.email, this.age});
}

class UserBuilder {
  String? _name;
  String? _email;
  int? _age;

  UserBuilder withName(String name) {
    _name = name;
    return this;
  }

  UserBuilder withEmail(String email) {
    _email = email;
    return this;
  }

  UserBuilder withAge(int age) {
    _age = age;
    return this;
  }

  User build() {
    return User(name: _name, email: _email, age: _age);
  }
}

void main(){
  final user = UserBuilder()
      .withName('Bento')
      .withEmail('bento@flutter.dev')
      .build();
  print(user.name);
  print(user.email);
  print(user.age);
}