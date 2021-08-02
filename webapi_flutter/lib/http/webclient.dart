import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    print("======================= REQUEST =======================");
    print('URL: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    print("======================= RESPONSE =======================");
    print('status: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

}

void  buscarTudo() async {
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  var response = await client.get(Uri.parse('http://192.168.0.19:8080/transactions'));
  print(response.body);
}
