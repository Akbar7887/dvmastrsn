class Login {
    String? name;
    String? tabel;

    Login({this.name, this.tabel});

    factory Login.fromJson(Map<String, dynamic> json) {
        return Login(
            name: json['name'], 
            tabel: json['tabel'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['tabel'] = this.tabel;
        return data;
    }
}