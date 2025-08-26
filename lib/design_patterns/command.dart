abstract class Command {
  void execute();
}

class CopyCommand implements Command {
  @override
  void execute() {
    print('Text copied!');
  }
}

class PasteCommand implements Command {
  @override
  void execute() {
    print('Text pasted!');
  }
}

class Invoker {
  Command? _command;

  void setCommand(Command command) {
    _command = command;
  }

  void executeCommand() {
    _command?.execute();
  }
}

void main(){
  final invoker = Invoker();
  invoker.setCommand(CopyCommand());
  invoker.executeCommand();
}