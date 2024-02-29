class Automobile {
    String? code;
    String? color;
    String? engine;
    String? model;
    String? vin;

    Automobile({this.code, this.color, this.engine, this.model, this.vin});

    factory Automobile.fromJson(Map<String, dynamic> json) {
        return Automobile(
            code: json['code'], 
            color: json['color'], 
            engine: json['engine'], 
            model: json['model'], 
            vin: json['vin'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['color'] = this.color;
        data['engine'] = this.engine;
        data['model'] = this.model;
        data['vin'] = this.vin;
        return data;
    }
}