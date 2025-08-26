abstract class AppBar {}
class LightAppBar implements AppBar {}
class DarkAppBar implements AppBar {}

abstract class ThemeFactory {
  AppBar createAppBar();
}

class LightThemeFactory implements ThemeFactory {
  @override
  AppBar createAppBar() => LightAppBar();
}

class DarkThemeFactory implements ThemeFactory {
  @override
  AppBar createAppBar() => DarkAppBar();
}

void main(){
  final ThemeFactory factory = DarkThemeFactory();
  final appBar = factory.createAppBar();
  print(appBar.runtimeType);
}
