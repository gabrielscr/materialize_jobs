import 'package:materialize_jobs/domain/profile.dart';
import 'package:materialize_jobs/utils/constants.dart';

class ProfileRepository {
  Profile get() {
    return Profile(
      careerDescription: 'Fullstack Developer - Flutter/.NET Core',
      name: 'Gabriel Rocha',
      image: Constants.profilePhoto,
      skills: [
        ProfileSkill(description: 'Flutter', level: 'Specialist'),
        ProfileSkill(description: '.NET Core', level: 'Specialist'),
      ],
    );
  }
}
