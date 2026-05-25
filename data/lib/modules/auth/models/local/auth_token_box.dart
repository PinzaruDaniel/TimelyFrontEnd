import 'package:objectbox/objectbox.dart';

@Entity()
class AuthTokenBox {
  @Id(assignable: true)
  int id;
  String? accessToken;
  String? refreshToken;

  AuthTokenBox({this.id = 0, this.accessToken, this.refreshToken});
}
