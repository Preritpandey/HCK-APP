class LostAndFoundDetails {
  final String name;
  final String phone;
  final String itemTitle;
  final String itemCategory;
  final String lostDate;
  final String block;
  final String itemDescription;
  final String additionalLocationDescription;
  final String status;
  final String date;
  LostAndFoundDetails({
    required this.name,
    required this.phone,
    required this.itemTitle,
    required this.itemCategory,
    required this.lostDate,
    required this.block,
    required this.itemDescription,
    required this.additionalLocationDescription,
    required this.status,
    required this.date,
  });

  factory LostAndFoundDetails.fromJson(Map<String, dynamic> json) {
    return LostAndFoundDetails(
      name: json['name'],
      phone: json['phone'],
      itemTitle: json['itemTitle'],
      itemCategory: json['itemCategory'],
      lostDate: json['lostDate'],
      block: json['block'],
      itemDescription: json['itemDescription'],
      additionalLocationDescription: json['additionalLocationDescription'],
      status: json['status'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'itemTitle': itemTitle,
      'itemCategory': itemCategory,
      'lostDate': lostDate,
      'block': block,
      'itemDescription': itemDescription,
      'additionalLocationDescription': additionalLocationDescription,
      'status': status,
      'date': date,
    };
  }
}
