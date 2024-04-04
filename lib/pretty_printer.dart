import 'dart:convert';

void prettyPrintJson(Map<String, dynamic> jsonMap) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyJsonString = encoder.convert(jsonMap);
  print(prettyJsonString);
}
