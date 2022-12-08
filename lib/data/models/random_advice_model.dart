import 'dart:convert';

import '../../domain/entitites/random_advice_entitie.dart';

RandomAdviceModel randomAdviceFromJson(String str) =>
    RandomAdviceModel.fromJson(json.decode(str));

String randomAdviceToJson(RandomAdviceModel data) => json.encode(data.toJson());

class RandomAdviceModel {
  RandomAdviceModel({
    required this.slip,
  });

  Slip? slip;

  factory RandomAdviceModel.fromJson(Map<String, dynamic> json) => RandomAdviceModel(
        slip: json["slip"] == null ? null : Slip.fromJson(json["slip"]),
      );

  Map<String, dynamic> toJson() => {
        "slip": slip == null ? null : slip!.toJson(),
      };

  RandomAdviceEntitie toEntity() => RandomAdviceEntitie(slip: slip!);

  List<Object?> get props => [slip];
}

class Slip {
  Slip({
    required this.id,
    required this.advice,
  });

  int? id;
  String? advice;

  factory Slip.fromJson(Map<String, dynamic> json) => Slip(
        id: json["id"] == null ? null : json["id"],
        advice: json["advice"] == null ? null : json["advice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "advice": advice == null ? null : advice,
      };
}
