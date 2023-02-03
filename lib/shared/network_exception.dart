class NetworkException implements Exception {
  int httpStatus;
  String data;
  String responseMessage;

  NetworkException(
      {this.httpStatus = 500, this.data = '', this.responseMessage = ''});

  @override
  String toString() {
    return '{ httpStatus : $httpStatus, data : $data, responseMessage $responseMessage } ';
  }
}
