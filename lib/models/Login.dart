class Login {
    String? name;
    String? tabel;
    String? service;

    Login({this.name, this.tabel, this.service});

    factory Login.fromJson(Map<String, dynamic> json) {
        return Login(
            name: json['name'],
            tabel: json['tabel'],
            service: json['service'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['tabel'] = this.tabel;
        data['service'] = this.service;
        return data;
    }
}