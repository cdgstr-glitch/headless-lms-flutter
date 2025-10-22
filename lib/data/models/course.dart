class Course {
  const Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.status,
    this.excerpt,
    this.thumbnailUrl,
    this.price,
  });

  final int id;
  final String title;
  final String slug;
  final String status;
  final String? excerpt;
  final String? thumbnailUrl;
  final String? price;

  factory Course.fromJson(Map<String, dynamic> json) {
    final title = _parseTitle(json);
    final excerpt = _parseExcerpt(json);
    final thumbnail = _parseThumbnail(json);

    return Course(
      id: _parseId(json['id']),
      title: title,
      slug: json['slug'] as String? ?? '',
      status: json['status'] as String? ?? 'draft',
      excerpt: excerpt,
      thumbnailUrl: thumbnail,
      price: _parsePrice(json),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
      'status': status,
      'excerpt': excerpt,
      'thumbnailUrl': thumbnailUrl,
      'price': price,
    };
  }

  static int _parseId(dynamic value) {
    if (value is int) {
      return value;
    }
    if (value is String) {
      return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static String _parseTitle(Map<String, dynamic> json) {
    final rawTitle = json['title'];
    if (rawTitle is Map<String, dynamic>) {
      return rawTitle['rendered'] as String? ?? 'Untitled Course';
    }

    if (rawTitle is String && rawTitle.isNotEmpty) {
      return rawTitle;
    }

    final name = json['name'];
    if (name is String && name.isNotEmpty) {
      return name;
    }

    return 'Untitled Course';
  }

  static String? _parseExcerpt(Map<String, dynamic> json) {
    final rawExcerpt = json['excerpt'];
    if (rawExcerpt is Map<String, dynamic>) {
      return rawExcerpt['rendered'] as String?;
    }

    return rawExcerpt as String?;
  }

  static String? _parseThumbnail(Map<String, dynamic> json) {
    final featuredImage = json['featured_image'];
    if (featuredImage is Map<String, dynamic>) {
      return (featuredImage['thumbnail'] as String?) ??
          (featuredImage['full'] as String?);
    }

    if (featuredImage is String) {
      return featuredImage;
    }

    final image = json['image'];
    if (image is Map<String, dynamic>) {
      return (image['thumbnail'] as String?) ?? (image['full'] as String?);
    }

    return null;
  }

  static String? _parsePrice(Map<String, dynamic> json) {
    final price = json['price'];
    if (price is String && price.isNotEmpty) {
      return price;
    }

    if (price is num) {
      return price.toString();
    }

    final originPrice = json['origin_price'];
    if (originPrice is String && originPrice.isNotEmpty) {
      return originPrice;
    }

    return null;
  }
}
