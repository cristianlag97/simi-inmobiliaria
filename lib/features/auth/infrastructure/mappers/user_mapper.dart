import '../../domain/domain.dart';
import '../models/user.dart';

class UserMapper {
  static UserEntity userJsonToEntity(User data) =>
      UserEntity(token: data.token, expiration: data.expiration);
}
