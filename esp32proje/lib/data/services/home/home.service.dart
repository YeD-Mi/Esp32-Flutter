import 'package:esp32proje/data/services/home/model/home_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:http/http.dart' as http;

abstract class HomeService {
  Future getdataid(String deneUrl);
  Future getdataCurrent(String deneUrl);
  Future getdataVoltage(String deneUrl);
  Future getdataTemperature(String deneUrl);
  Future getdataDate(String deneUrl);
}

class HomeServiceImp extends HomeService {
  @override
  Future getdataid(String deneUrl) async {
    final response = await http.get(Uri.parse(deneUrl));
    var dataIdList = [];
    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        dataIdList.add(data[i].id);
      }
      return dataIdList;
    } else {
      return '';
    }
  }

  Future getdataCurrent(String deneUrl) async {
    final response = await http.get(Uri.parse(deneUrl));

    var dataCurrentList = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        dataCurrentList.add(data[i].amper);
      }
      return dataCurrentList;
    } else {
      return '';
    }
  }

  Future getdataVoltage(String deneUrl) async {
    final response = await http.get(Uri.parse(deneUrl));

    var dataVoltageList = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        dataVoltageList.add(data[i].volt);
      }
      return dataVoltageList;
    } else {
      return '';
    }
  }

  Future getdataTemperature(String deneUrl) async {
    final response = await http.get(Uri.parse(deneUrl));

    var dataTemperatureList = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        dataTemperatureList.add(data[i].sicaklik);
      }
      return dataTemperatureList;
    } else {
      return '';
    }
  }

  Future getdataDate(String deneUrl) async {
    final response = await http.get(Uri.parse(deneUrl));

    var dataDateList = [];

    if (response.statusCode == 200) {
      var data = homeResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        dataDateList.add(data[i].date);
      }
      return dataDateList;
    } else {
      return '';
    }
  }
}
