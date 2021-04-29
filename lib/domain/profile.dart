class Profile {
  String name;
  String image;
  String careerDescription;
  List<ProfileSkill> skills = [];

  Profile({this.name, this.image, this.careerDescription, this.skills});
}

class ProfileSkill {
  String level;
  String description;

  ProfileSkill({this.level, this.description});
}
