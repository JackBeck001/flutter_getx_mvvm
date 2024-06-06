abstract class BaseApiService {
  Future<dynamic> getApi(String Url);
  Future<dynamic> postApi(String Url, dynamic data);
}
