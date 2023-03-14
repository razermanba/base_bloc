import 'package:fimber/fimber.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  final int? id;
  final String? title;
  final String? description;

  HomeResponse(this.id, this.title, this.description);

  factory HomeResponse.fromJson(Map<String, dynamic> json) {
    try{
      return _$HomeResponseFromJson(json);
    } on Exception catch (e) {
      Fimber.e('Exception occurred in navigateTo: $e');
      return HomeResponse(0, "", "");
    }

  }

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
