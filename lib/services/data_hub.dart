import 'package:dart_airtable/dart_airtable.dart';
import 'package:mr_stokka/services/product.dart';

class DataHub {

  final _apiKey ="keyRZ9wpswVaGK244";
  final _projectBase = "appspC8LXpu6kv5tG";
  final _recordName = 'Inventory';

  List<Product> _products = List<Product>();
  List<String> _uniqueBrands = List<String>();

  void setData(List<AirtableRecord> records){
    for(var i=0;i<records.length;i++){
      _uniqueBrands.add(records[i].toJSON()['fields']['Brand']);
      _products.add(Product(
        brand: records[i].toJSON()['fields']['Brand'],
        item: records[i].toJSON()['fields']['Items\nBought'],
        price: records[i].toJSON()['fields']['Per Price\nAUD'],
        image: records[i].toJSON()['fields']['Image']
      ));
    }
  }
  List<Product> getProductList(){
    return _products;
  }

  List<String> getUniqueBrandList(){
    print(_uniqueBrands.length);
    print(_uniqueBrands.toSet().toList().length);
    return _uniqueBrands.toSet().toList();
  }

  Future<List<AirtableRecord>> getRecords() async {
    var airtable = Airtable(apiKey: _apiKey, projectBase: _projectBase);
    var results = await airtable.getAllRecords(_recordName);
    return results;
  }

}