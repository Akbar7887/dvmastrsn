import 'dart:ffi';

import 'Item.dart';

class Naryad {
    String? auto;
    String? date;
    List<Item>? items;
    String? nomer;
    String? status;
    String? amount;
    bool? uchet;

    Naryad({this.auto, this.date, this.items, this.nomer, this.status, this.amount, this.uchet});

    factory Naryad.fromJson(Map<String, dynamic> json) {
        return Naryad(
            auto: json['auto'], 
            date: json['date'], 
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null, 
            nomer: json['nomer'], 
            status: json['status'],
            amount: json['amount'],
            uchet: json['uchet']
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['auto'] = this.auto;
        data['date'] = this.date;
        data['nomer'] = this.nomer;
        data['status'] = this.status;
        if (this.items != null) {
            data['items'] = this.items!.map((v) => v.toJson()).toList();
        }
        data['amount'] = this.amount;
        data['uchet'] = this.uchet;
        return data;
    }
}