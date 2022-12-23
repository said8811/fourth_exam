import 'package:dio/dio.dart';

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return "So'rov noto'g'ri";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Noma'lum xatolik yuz berdi, keyinroq qayta urinib ko'ring.";
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Xatolik yuz berdi';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Shaxs royhatan otmagan";
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "malumot topib bo'lmadi";
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Internet mavjud emas, qayta urinib ko'ring.";
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return "Ulanish Vaqti tugadi. Iltimos qayta urining!";
  }
}

class ReceiveTimeOutException extends DioError {
  ReceiveTimeOutException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Qabul qilish vaqti tugadi, qayta urining";
  }
}
