class ClientProductGroup
{
  final int id;
  final int? mainProductGroupId;
  final String name;
  final String color;

  ClientProductGroup.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mainProductGroupId = json['mainProductGroupId'],
        name = json['name'],
        color = json['color'];
}