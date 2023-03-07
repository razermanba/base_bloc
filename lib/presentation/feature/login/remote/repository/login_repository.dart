import '../../../../../core/common/result.dart';

abstract class LoginRepository{
  Future<Result<LoginResponse>> performLogin(LoginRequest model);
}