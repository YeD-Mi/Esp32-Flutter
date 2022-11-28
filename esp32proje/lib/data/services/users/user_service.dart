import 'package:esp32proje/data/services/users/model/users_response.dart';
import 'package:esp32proje/data/src/string.dart';
import 'package:http/http.dart' as http;

abstract class UserService {
  Future getusername();
  Future getUserEmail();
  Future getDate();
  Future getuserparola();
  Future getuserid();
  Future getuserregion();
  Future getuseradmin();
  Future getisRemove();
}

class UserServiceImp extends UserService {
  @override
  Future getusername() async {
    final response = await http.get(Uri.parse(usersUrl));

    var userListusername = [];

    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListusername.add(data[i].username);
      }
      return userListusername;
    } else {
      return '';
    }
  }

  Future getUserEmail() async {
    final response = await http.get(Uri.parse(usersUrl));

    var userListMail = [];

    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListMail.add(data[i].email);
      }
      return userListMail;
    } else {
      return '';
    }
  }

  @override
  Future getDate() async {
    var _url = Uri.parse(usersUrl);
    final response = await http.get(_url);
    var userListDate = [];

    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListDate.add(data[i].date);
      }
      return userListDate;
    } else {
      return '';
    }
  }

  Future getuserparola() async {
    final response = await http.get(Uri.parse(usersUrl));
    var userListparola = [];
    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListparola.add(data[i].parola);
      }
      return userListparola;
    } else {
      return '';
    }
  }

  Future getuserid() async {
    final response = await http.get(Uri.parse(usersUrl));
    var userListId = [];
    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListId.add(data[i].userid);
      }
      return userListId;
    } else {
      return '';
    }
  }

  Future getuserregion() async {
    final response = await http.get(Uri.parse(usersUrl));
    var userListRegion = [];
    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListRegion.add(data[i].region);
      }
      return userListRegion;
    } else {
      return '';
    }
  }

  Future getuseradmin() async {
    final response = await http.get(Uri.parse(usersUrl));
    var userListAdmin = [];
    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userListAdmin.add(data[i].admin);
      }
      return userListAdmin;
    } else {
      return '';
    }
  }

  Future getisRemove() async {
    final response = await http.get(Uri.parse(usersUrl));
    var userisRemove = [];
    if (response.statusCode == 200) {
      var data = userResponseModelFromJson(response.body);
      for (int i = 0; i < data.length; i++) {
        userisRemove.add(data[i].isremove);
      }
      return userisRemove;
    } else {
      return '';
    }
  }
}
