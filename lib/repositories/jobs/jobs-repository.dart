import 'package:materialize_jobs/domain/job-role.dart';
import 'package:materialize_jobs/domain/job.dart';

class JobsRepository {
  List<Job> list() {
    List<Job> jobs = [];

    return mockListJobs(jobs);
  }

  List<JobRole> listRoles() {
    List<JobRole> jobRoles = [];

    return mockListJobsRoles(jobRoles);
  }

  List<Job> mockListJobs(List<Job> jobs) {
    jobs.add(Job(
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        title: 'Construir E-Commerce',
        place: 'Materialize.pro',
        tags: ['Flutter', 'Specialist', 'Design'],
        role: JobRole(id: 1, title: 'Flutter'),
        requirements: [
          JobRequirement(item: 'Experiência de 3+ anos com Flutter'),
          JobRequirement(item: 'Experiência de 3+ anos com Design'),
          JobRequirement(item: 'Ser especialista na ferramenta'),
        ],
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 2',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        tags: ['Flutter', 'Specialist'],
        role: JobRole(id: 1, title: 'Flutter'),
        requirements: [
          JobRequirement(item: 'Ser especialista na ferramenta'),
        ],
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 3',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        tags: ['Flutter', 'Design'],
        role: JobRole(id: 1, title: 'Flutter'),
        requirements: [
          JobRequirement(item: 'Experiência de 3+ anos com Flutter'),
          JobRequirement(item: 'Ser especialista na ferramenta'),
        ],
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 4',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        tags: ['Flutter'],
        role: JobRole(id: 5, title: 'UI/UX'),
        requirements: [
          JobRequirement(item: 'Experiência de 3+ anos com Flutter'),
        ],
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 5',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        tags: ['Flutter'],
        role: JobRole(id: 2, title: 'Android/IOS'),
        requirements: [
          JobRequirement(item: 'Experiência de 3+ anos com Flutter'),
        ],
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    return jobs;
  }

  List<JobRole> mockListJobsRoles(List<JobRole> jobRoles) {
    jobRoles.add(JobRole(id: 1, title: 'Flutter'));
    jobRoles.add(JobRole(id: 2, title: 'Android/IOS'));
    jobRoles.add(JobRole(id: 3, title: '.NET Core'));
    jobRoles.add(JobRole(id: 4, title: 'Java'));
    jobRoles.add(JobRole(id: 5, title: 'UI/UX'));

    return jobRoles;
  }
}
