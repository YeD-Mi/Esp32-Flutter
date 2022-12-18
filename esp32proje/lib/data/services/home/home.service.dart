import 'package:esp32proje/data/services/home/model/home_response.dart';
import 'package:http/http.dart' as http;

abstract class HomeService {
  Future getdataid(String dataUrl);
  Future getdataCurrent(String dataUrl);
  Future getdataVoltage(String dataUrl);
  Future getdataTemperature(String dataUrl);
  Future getdataDate(String dataUrl);
}

class HomeServiceImp extends HomeService {
  @override
  Future getdataid(String dataUrl) async {
    final response = await http.get(Uri.parse(dataUrl));
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

  @override
  Future getdataCurrent(String dataUrl) async {
    final response = await http.get(Uri.parse(dataUrl));

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

  @override
  Future getdataVoltage(String dataUrl) async {
    final response = await http.get(Uri.parse(dataUrl));

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

  @override
  Future getdataTemperature(String dataUrl) async {
    final response = await http.get(Uri.parse(dataUrl));

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

  @override
  Future getdataDate(String dataUrl) async {
    final response = await http.get(Uri.parse(dataUrl));

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
