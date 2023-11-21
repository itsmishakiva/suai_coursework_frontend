class BasicUserDto {
  int id;
  String username;
  int avatarColor;
  String? avatarPath;
  String? name;
  String? surname;
  String? statusInfo;
  String? description;
  String? email;

  BasicUserDto({
    required this.id,
    required this.username,
    required this.avatarColor,
    this.avatarPath,
    this.name,
    this.surname,
    this.statusInfo,
    this.description,
    this.email,
  });

  factory BasicUserDto.fromJson(Map<String, dynamic> json) {
    return BasicUserDto(
      id: json['id'],
      username: json['username'],
      avatarColor: json['avatarColor'],
      avatarPath: json['avatarPath'],
      name: json['name'],
      surname: json['surname'],
      statusInfo: json['statusInfo'],
      description: json['description'],
      email: json['email'],
    );
  }
}
