import 'package:dart_airtable/dart_airtable.dart';

class DataHub {
//  List<AirtableRecord> _records;

  final _apiKey ="keyRZ9wpswVaGK244";
  final _projectBase = "appspC8LXpu6kv5tG";
  final _recordName = 'Inventory';

  List<String> _brand = List<String>();
  List<String> _item = List<String>();
  List<String> _price = List<String>();

  void setData(List<AirtableRecord> records){
    for(var i=0;i<records.length;i++){
      _brand.add(records[i].toJSON()['fields']['Brand']);
      _item.add(records[i].toJSON()['fields']['Items\nBought']);
      _price.add(records[i].toJSON()['fields']['Per Price\nAUD']);
    }
  }

  List<String> getBrandList(){
    return _brand;
  }

  List<String> getItemList(){
    return _item;
  }

  List<String> getPriceList(){
    return _price;
  }

  Future<List<AirtableRecord>> getRecords() async {
    var airtable = Airtable(apiKey: _apiKey, projectBase: _projectBase);
    var results = await airtable.getAllRecords(_recordName);
    return results;
  }

}