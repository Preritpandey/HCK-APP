class Events {
  final String title;
  final String organizer;
  final String dateTime;
  final String imageUrl;
  const Events(
      {required this.title,
      required this.organizer,
      required this.dateTime,
      required this.imageUrl});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
        title: json['title'],
        organizer: json['organizer'],
        dateTime: json['dateTime'],
        imageUrl: json['imageUrl']);
  }
}
