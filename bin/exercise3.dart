import 'package:exercise3/exercise3.dart' as exercise3;
import 'dart:convert' as convert;

void main(List<String> arguments) {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  exercise3.Students students = exercise3.Students(toListMap(json));

  print("---Students sort by First Name:");
  students.sort("first");
  students.output();

  print("\n---Students sort by Last Name:");
  students.sort("last");
  students.output();

  print("\n---Add a new student:");
  Map<String, String> newStudent = {
    "first": "Tyler",
    "last": "Bristow",
    "email": "bristot@algonquincollege.com"
  };
  students.plus(newStudent);
  students.output();

  print("\n---Delete an student by email:");
  students.remove("email", "robilla@algonquincollege.com");
  students.output();
}

List<Map<String, String>> toListMap(String json) {
  final dataList = convert.jsonDecode(json);
  List<Map<String, String>> listMaps = [];

  dataList.forEach((item) {
    Map<String, String> map = {};
    for (var field in item.keys) {
      map[field] = item[field].toString();
    }
    listMaps.add(map);
  });

  return listMaps;
}
