import 'package:dart_airtable/dart_airtable.dart';

void main() async {
  final apiKey = "keyRZ9wpswVaGK244";
  final projectBase = "appspC8LXpu6kv5tG";
  final recordName = 'Inventory';

  var airtable = Airtable(apiKey: apiKey, projectBase: projectBase);
  var records = await airtable.getAllRecords(recordName);
//  var getRecord = await airtable.getRecord(recordName, 'rec0OZdFJgYl6GQGt');

  print(records[0].toJSON()['fields']['Brand']);
  print(records[0].toJSON()['fields']['Items\nBought']);
  print(records[0].toJSON()['fields']['Per Price\nAUD']);

}