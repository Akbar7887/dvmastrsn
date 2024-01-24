class Itemservice {
    String? model;
    String? price;

    Itemservice({this.model, this.price});

    factory Itemservice.fromJson(Map<String, dynamic> json) {
        return Itemservice(
            model: json['model'], 
            price: json['price'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['model'] = this.model;
        data['price'] = this.price;
        return data;
    }
}