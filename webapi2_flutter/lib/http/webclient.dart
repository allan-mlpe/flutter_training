import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:webapi2_flutter/http/interceptors/logging_interceptor.dart';

final Client apiClient = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
  requestTimeout: Duration(seconds: 5), // configuração global de timeout
);