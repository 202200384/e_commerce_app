class Errors{
  String errorMsg;
  Errors({required this.errorMsg});
}
class ServerError extends Errors{
  ServerError({required super.errorMsg});
}
class NetworkError extends Errors{
  NetworkError({required super.errorMsg});
}