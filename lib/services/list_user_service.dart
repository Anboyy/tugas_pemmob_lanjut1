import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();

  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = "http://apikoperasi.rey1024.com/users";
    final Response response;
    try {
      response = await dio.get(
        url,
      );
      // print(response.data);
      if (response.statusCode == 200) {
        var json1 = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json1 is List) {
          return json1
              .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
              .toList();
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (await prefs.getString('username') == null) {
      await prefs.setBool('isLoged', true);
      await prefs.setString('username', username);
      await prefs.setString('password', password);
    }
    String url = 'http://apikoperasi.rey1024.com';
    final Response response;
    FormData formData =
        FormData.fromMap({"username": username, "password": password});
    // {"username": username, "password": password};

    // dio.options.headers['Authentication'] = 'Bearer $token'
    // dio.options.headers['Content type'] = 'aplication/json'
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.statusCode == 200) {
      final data = response.data;
      // print(data['user_id']);
      return ListUsersModel(
        user_id: data[0]['user_id'],
        username: username,
        password: password,
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
      // return print(response.statusCode);
    } else {
      return print('gagal');
    }
  }

  //Transfer Service
  transfer(
    int id_pengirim,
    double jumlah_setoran,
    String nomor_rekening,
  ) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap({
      "id_pengirim": id_pengirim,
      "jumlah_transfer": jumlah_setoran,
      "nomor_rekening": nomor_rekening
    });
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
    } catch (e) {
      print('gagal');
    }
  }

  tarikSaldo(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/tarikan';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_tarikan": jumlah_tarikan});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
      print(response.data);
    } catch (e) {
      print('gagal');
    }
  }

  getSaldo(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      final data = response.data;
      print(data[0]['saldo']);
      return int.parse(data[0]['saldo']);
      // return print(response.statusCode);
    } else {
      return print('gagal');
    }
  }

  getSingleUser(int user_id) async {
    String url = 'http://apikoperasi.rey1024.com/getsingleuser';
    final Response response;
    FormData formData = FormData.fromMap({"user_id": user_id});
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      final data = response.data;
      return ListUsersModel(
        user_id: data[0]['user_id'],
        username: data[0]['username'],
        password: data[0]['password'],
        nama: data[0]['nama'],
        saldo: data[0]['saldo'],
        nomor_rekening: data[0]['nomor_rekening'],
      );
      // return print(response.statusCode);
    } else {
      return print('gagal');
    }
  }

  setorSaldo(int user_id, double jumlah_setoran) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
      print(response.data);
    } catch (e) {
      print('gagal');
    }
  }

  postRegister(
      String username, String password, String nama, String nim) async {
    String url = 'http://apikoperasi.rey1024.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama, "nim": nim});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['status'] == "success") {
      print('Berhasil');
    } else {
      print(response.data);
      // return postRegister(username, password, nama, nim);
    }
  }
}
