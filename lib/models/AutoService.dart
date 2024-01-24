import 'Itemservice.dart';

class AutoService {
  List<Itemservice>? itemservice;
  String? name;
  int? rownumber;

  AutoService({this.itemservice, this.name, this.rownumber});

  factory AutoService.fromJson(Map<String, dynamic> json) {
    return AutoService(
      itemservice: json['itemservice'] != null
          ? (json['itemservice'] as List)
              .map((i) => Itemservice.fromJson(i))
              .toList()
          : null,
      name: json['name'],
      rownumber: json['rownumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['rownumber'] = this.rownumber;
    if (this.itemservice != null) {
      data['itemservice'] = this.itemservice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
