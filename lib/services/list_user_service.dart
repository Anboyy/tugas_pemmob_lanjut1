import 'package:dio/dio.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';

class ListUsersService {
  Dio dio = Dio();

  Future<List<ListUsersModel>?> getDataUsers() async {
    String url = "https://koperasiundiksha.000webhostapp.com/users";
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
          var data = json['data'];
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
    String url = 'https://koperasiundiksha.000webhostapp.com';
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
    if (response.data['status'] == "success") {
      final data = response.data;
      print(data['user_id']);
      return ListUsersModel(
        user_id: data['data'][0]['user_id'],
        username: username,
        password: password,
        nama: data['data'][0]['nama'],
        saldo: data['data'][0]['saldo'],
      );
    } else {
      // final data = jsonDecode(response.data);
      // final runHyperlink = data['data'].map( (e) => e['nama']).toList().cast<Map<String, dynamic>>();
      // final dataUser = data['data']
      //     .map((i) => i['nama'])
      //     .toList().cast<Map<String, dynamic>>();
      // print(dataUser);
      // print(response.data['data'][0]['nama']);
      return postLogin(username, password);
    }
  }

  transfer(int user_id, double jumlah_setoran) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/setoran';
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
    String url = 'https://koperasiundiksha.000webhostapp.com/tarikan';
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

  postRegister(String username, String password, String nama) async {
    String url = 'https://koperasiundiksha.000webhostapp.com/register';
    final Response response;
    FormData formData = FormData.fromMap(
        {"username": username, "password": password, "nama": nama});
    response = await dio.post(
      url,
      data: formData,
    );
    if (response.data['pesan'] == "Data berhasil disimpan, saldo awal 50.000") {
      print('Berhasil');
    } else {
      print(response.data);
      return postRegister(username, password, nama);
    }
  }
}
