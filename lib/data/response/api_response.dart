import 'package:flutter_getx_mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status \n Data: $data \n Message: $message';
  }
}
