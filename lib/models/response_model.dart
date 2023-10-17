
class ResponseModel {
  bool _isSuccess;
  String _message;
  int _responseCode;

  ResponseModel(this._isSuccess, this._message,this._responseCode);

  String get message => _message;
  bool get isSuccess => _isSuccess;
  int get responseCode => _responseCode;

}