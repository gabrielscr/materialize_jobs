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
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 2',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 3',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    jobs.add(Job(
        title: 'Construir E-Commerce 4',
        image: 'https://accendadigital.com.br/wp-content/uploads/2020/05/accenda-ecommerce.png',
        place: 'Materialize.pro',
        details:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit, enim mollis gravida sodales, dui purus commodo tortor.'));

    return jobs;
  }

  List<JobRole> mockListJobsRoles(List<JobRole> jobRoles) {
    jobRoles.add(JobRole(id: 1, title: 'Flutter'));
    jobRoles.add(JobRole(id: 2, title: 'Android/IOS'));
    jobRoles.add(JobRole(id: 3, title: '.NET Core'));
    jobRoles.add(JobRole(id: 4, title: 'Java'));
    jobRoles.add(JobRole(id: 1, title: 'UI/UX'));

    return jobRoles;
  }
}
