class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  void connect() {
    print('Connecting to database...');
  }
}

void main() {
  final db1 = DatabaseHelper();
  final db2 = DatabaseHelper();
  db1.connect();
  db2.connect();
  print(db1 == db2); // true
}