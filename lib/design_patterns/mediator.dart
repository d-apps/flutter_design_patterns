abstract class Component {
  Mediator? mediator;
}

abstract class Mediator {
  void notify(Component sender, String event);
}

class ConcreteMediator implements Mediator {
  final LoginButton _loginButton;
  final PasswordField _passwordField;

  ConcreteMediator(this._loginButton, this._passwordField) {
    _loginButton.mediator = this;
    _passwordField.mediator = this;
  }

  @override
  void notify(Component sender, String event) {
    if (sender is LoginButton && event == 'click') {
      if (_passwordField.text.isNotEmpty) {
        print('Validating login...');
      } else {
        print('Password must not be empty!');
      }
    }
  }
}

class LoginButton extends Component {
  void click() {
    print('Button clicked!');
    mediator?.notify(this, 'click');
  }
}

class PasswordField extends Component {
  String text = '';
}

void main(){
  final button = LoginButton();
  final password = PasswordField();

  final mediator = ConcreteMediator(button, password);
  mediator.notify(button, 'click');

  button.click();
  password.text = 'minhasenha123';
  button.click();


}