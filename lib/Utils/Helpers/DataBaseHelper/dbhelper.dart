import 'package:contact_app_final_test_af/Model/ContactModel/contactmodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  DB_Helper._();

  static final DB_Helper db_helper = DB_Helper._();

  static Database? database;
  static String contact_table = "contact";
  static String contact_id = "id";
  static String contact_name = "name";
  static String contact_email = "email";
  static String contact_enumber = "number";

  initDB() async {
    String db_Path = join(await getDatabasesPath(), 'bb.db');

    database = await openDatabase(db_Path, version: 1,
        onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $contact_table(id INTEGER PRIMARY KEY AUTOINCREMENT,$contact_name TEXT NOT NULL,$contact_email TEXT NOT NULL,$contact_enumber TEXT NOT NULL)";
      await db.execute(query);
    });
  }

  Future<int?> insertContact({required Contact con_data}) async {
    await initDB();
    String query =
        "INSERT INTO $contact_table($contact_name,$contact_email,$contact_enumber) VALUES(?,?,?)";
    List args = [con_data.name, con_data.email, con_data.number];
    int? res = await database?.rawInsert(query, args);
    return res;
  }

  Future<int?> insertCaontact({required Contact con_data}) async {
    await initDB();
    String query =
        "INSERT INTO $contact_table($contact_name,$contact_email,$contact_enumber) VALUES(?,?,?)";
    List args = [con_data.name, con_data.email, con_data.number];
    int? res = await database?.rawInsert(query, args);
    return res;
  }

  Future<List<Contact>> fetchContactData() async {
    await initDB();
    String query = "SELECT * FROM $contact_table;";
    List<Map<String, dynamic>> fetchedData = await database!.rawQuery(query);
    List<Contact> fetchedCategory =
        fetchedData.map((e) => Contact.fromSQL(data: e)).toList();
    return fetchedCategory;
  }

  Future<int?> deleteContact({required int id}) async {
    await initDB();
    String query = "DELETE FROM $contact_table WHERE $contact_id=$id;";
    int? res = await database?.rawDelete(query);
    return res;
  }

  Future<int?> updateContact({required Contact data, required int id}) async {
    await initDB();
    String query =
        "UPDATE $contact_table SET $contact_name=?,$contact_email=?,$contact_enumber=? WHERE $contact_id=$id;";
    List args = [data.name, data.email, data.number];
    int? res = await database?.rawUpdate(query, args);
    return res;
  }
}
