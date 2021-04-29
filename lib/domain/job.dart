import 'job-role.dart';

class Job {
  int id;
  String title;
  String place;
  String image;
  String details;
  JobRole role;
  List<String> tags = [];
  List<JobRequirement> requirements = [];

  Job({this.title, this.place, this.image, this.details, this.role, this.tags, this.requirements});
}

class JobRequirement {
  String item;

  JobRequirement({this.item});
}
