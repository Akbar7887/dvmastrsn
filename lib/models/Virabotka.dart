class Virabotka {
    String? date;
    String? datef;
    String? fakt;
    String? procent;
    bool? received;
    String? revenue;

    Virabotka({this.date, this.fakt, this.procent, this.received, this.revenue, this.datef});

    factory Virabotka.fromJson(Map<String, dynamic> json) {
        return Virabotka(
            date: json['date'], 
            fakt: json['fakt'], 
            procent: json['procent'], 
            received: json['received'],
            revenue: json['revenue'],
            datef: json['datef'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['fakt'] = this.fakt;
        data['procent'] = this.procent;
        data['received'] = this.received;
        data['revenue'] = this.revenue;
        data['datef'] = this.datef;
        return data;
    }
}