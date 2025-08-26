abstract class FileSystemEntity {
  void printName();
}

class Directory implements FileSystemEntity {
  final String name;
  final List<FileSystemEntity> children = [];

  Directory(this.name);

  void add(FileSystemEntity entity) {
    children.add(entity);
  }

  @override
  void printName() {
    print('Directory: $name');
    for (var child in children) {
      child.printName();
    }
  }
}

class File implements FileSystemEntity {
  final String name;
  File(this.name);

  @override
  void printName() {
    print('File: $name');
  }
}

void main(){
  final root = Directory('Documents');
  final flutterProject = Directory('FlutterProjects');
  final designPatterns = Directory('design_patterns');
  flutterProject.add(designPatterns);
  flutterProject.add(File('main.dart'));
  root.add(flutterProject);
  root.printName();
}