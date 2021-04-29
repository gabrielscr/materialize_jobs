class Profile {
  String name;
  String careerDescription;
  List<ProfileSkill> skills = [];

  Profile({this.name, this.careerDescription, this.skills});
}

class ProfileSkill {
  double rate;
  String description;

  ProfileSkill({this.rate, this.description});
}
