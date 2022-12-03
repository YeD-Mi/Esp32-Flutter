import 'package:esp32proje/data/src/string.dart';
import 'package:get/get.dart';
import '../../data/services/home/home.service.dart';
import 'package:get/state_manager.dart';
import 'package:esp32proje/data/src/string.dart';

class HomeController extends GetxController {
  final Rx<bool> isLoading = RxBool(false);
  final Rxn<dynamic> error = Rxn<dynamic>();
  final Rxn<List> dataIdList = Rxn();
  final Rxn<List> dataCurrentList = Rxn();
  final Rxn<List> dataVoltageList = Rxn();
  final Rxn<List> dataTemperatureList = Rxn();
  final Rxn<List> dataDateList = Rxn();

  final HomeService _homeService;
  HomeController(this._homeService);

  @override
  void onInit() {
    _callingGetDataID();
    _callingGetDataCurrent();
    _callingGetDataVoltage();
    _callingGetDataTemperature();
    _callingGetDataDate();
    super.onInit();
  }

  void _callingGetDataID() {
    isLoading.call(true);
    _homeService.getdataid(regionUrl.string).then((value) {
      dataIdList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetDataCurrent() {
    isLoading.call(true);
    _homeService.getdataCurrent(regionUrl.string).then((value) {
      dataCurrentList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetDataVoltage() {
    isLoading.call(true);
    _homeService.getdataVoltage(regionUrl.string).then((value) {
      dataVoltageList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetDataTemperature() {
    isLoading.call(true);
    _homeService.getdataTemperature(regionUrl.string).then((value) {
      dataTemperatureList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }

  void _callingGetDataDate() {
    isLoading.call(true);
    _homeService.getdataDate(regionUrl.string).then((value) {
      dataDateList.value = value;
    }).catchError((dynamic error) {
      this.error.trigger(error);
      print(error);
    }).whenComplete(() {
      isLoading.call(false);
    });
  }
}
