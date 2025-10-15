class WalkthroughModel {
  final String? title;
  final String description;

  WalkthroughModel({required this.title, required this.description});

  factory WalkthroughModel.fromJson(Map<String, dynamic> json) {
    return WalkthroughModel(
      title: json['title'] as String?,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {if (title != null) 'title': title, 'description': description};
  }
}
