main() {
  final Command selectedCommand = SaveCommand();
  selectedCommand.execute();
}

abstract interface class Command {
  void execute();
  // void undo();
  // void redo();
}

class SaveCommand implements Command {
  @override
  void execute() {
    print("Save command executed");
  }
}

class OpenCommand implements Command {
  @override
  void execute() {
    print("Save command executed");
  }
}

class CopyCommand implements Command {
  @override
  void execute() {
    print("Save command executed");
  }
}