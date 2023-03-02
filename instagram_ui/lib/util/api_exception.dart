class ApiException implements Exception{
  int?    exceptionStatusCode;
  String? exceptionMessage;
  ApiException(this.exceptionStatusCode,this.exceptionMessage);
}