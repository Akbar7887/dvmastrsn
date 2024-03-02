class Peredprodajka {
    String? tabel;
    List<String>? vins;

    Peredprodajka({this.tabel, this.vins});

    factory Peredprodajka.fromJson(Map<String, dynamic> json) {
        return Peredprodajka(
            tabel: json['tabel'], 
            vins: json['vins'] != null ? new List<String>.from(json['vins']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['tabel'] = this.tabel;
        if (this.vins != null) {
            data['vins'] = this.vins;
        }
        return data;
    }
}