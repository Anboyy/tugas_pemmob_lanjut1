import 'package:dio/dio.dart';
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
        var json = response.data;
        //boleh dipakai sesuai kondisi data json
        if (json is Map && json.keys.contains('data')) {
          var data = json[0]['data'];
          if (data is List) {
            return data
                .map<ListUsersModel>((u) => ListUsersModel.fromJson(u))
                .toList();
          }
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  postLogin(String username, String password) async {
    // final prefs = await SharedPreferences.getInstance();
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

  transfer(int user_id, double jumlah_setoran, String nomor_rekening) async {
    String url = 'http://apikoperasi.rey1024.com/transfer';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_setoran});
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
    } catch (e) {
      print('gagal');
    }
  }

  setorSaldo(int user_id, double jumlah_tarikan) async {
    String url = 'http://apikoperasi.rey1024.com/setoran';
    final Response response;
    FormData formData = FormData.fromMap(
        {"user_id": user_id, "jumlah_setoran": jumlah_tarikan});
    try {
      response = await dio.post(url, data: formData);
      print('berhasil');
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
