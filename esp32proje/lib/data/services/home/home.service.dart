import 'package:esp32proje/data/services/home/model/home_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:http/http.dart' as http;

abstract class HomeService {
  Future getdataid();
  Future getdataCurrent();
  Future getdataVoltage();
  Future getdataTemperature();
  Future getdataDate();
}

class HomeServiceImp extends HomeService {
  @override
  Future getdataid() async {
    final response = await http.get(Uri.parse(espUrl));
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

  Future getdataCurrent() async {
    final response = await http.get(Uri.parse(espUrl));

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

  Future getdataVoltage() async {
    final response = await http.get(Uri.parse(espUrl));

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

  Future getdataTemperature() async {
    final response = await http.get(Uri.parse(espUrl));

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

  Future getdataDate() async {
    final response = await http.get(Uri.parse(espUrl));

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
