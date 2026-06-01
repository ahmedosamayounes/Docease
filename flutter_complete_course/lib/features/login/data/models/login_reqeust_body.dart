import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_reqeust_body.g.dart';
@JsonSerializable()
class LoginReqeustBody {
  final String email;
  final String password;

  LoginReqeustBody({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$LoginReqeustBodyToJson(this);
}
