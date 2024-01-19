class Item {
    int? amount;
    String? procent;
    int? quantity;
    String? service;

    Item({this.amount, this.procent, this.quantity, this.service});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
            amount: json['amount'], 
            procent: json['procent'], 
            quantity: json['quantity'], 
            service: json['service'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['procent'] = this.procent;
        data['quantity'] = this.quantity;
        data['service'] = this.service;
        return data;
    }
}