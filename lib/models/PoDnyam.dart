class PoDnyam {
    String? date;
    String? dept;

    PoDnyam({this.date, this.dept});

    factory PoDnyam.fromJson(Map<String, dynamic> json) {
        return PoDnyam(
            date: json['date'], 
            dept: json['dept'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['date'] = this.date;
        data['dept'] = this.dept;
        return data;
    }
}