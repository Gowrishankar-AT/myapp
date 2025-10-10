class Establishment {
  final String name;
  final String type;
  final String imageUrl;
  final String description;
  final List<String> galleryImageUrls;
  final double rentPerDay;
  final double rentPerPerson;
  final List<DateTime> bookedDates;

  Establishment({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.description,
    required this.galleryImageUrls,
    required this.rentPerDay,
    required this.rentPerPerson,
    required this.bookedDates,
  });
}
