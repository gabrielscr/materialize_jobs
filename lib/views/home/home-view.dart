import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:materialize_jobs/controllers/job-controller.dart';
import 'package:materialize_jobs/controllers/profile-controller.dart';
import 'package:materialize_jobs/domain/job-role.dart';
import 'package:materialize_jobs/domain/job.dart';
import 'package:materialize_jobs/domain/profile.dart';
import 'package:materialize_jobs/utils/routes.dart';
import 'package:materialize_jobs/views/jobs/job-detail-view.dart';
import 'package:materialize_jobs/widgets/loader-widget.dart';
import 'package:materialize_jobs/widgets/text-widget.dart';

class HomeView extends StatelessWidget {
  final ProfileController profileController = Get.find();
  final JobController jobController = Get.find();

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: renderAppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Obx(() => renderProfile(profileController.profile.value)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              child: TextWidget(
                fontSize: 25,
                text: 'Encontre seu cargo ideal\nem nosso time',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            renderSearch(),
            SizedBox(
              height: 20,
            ),
            renderRoles(jobController.roles),
            SizedBox(
              height: 20,
            ),
            renderJobs(jobController.jobs),
            SizedBox(
              height: 20,
            ),
            renderSpecialists(profileController.profile.value)
          ],
        ),
      ),
    );
  }

  Container renderProfile(Profile profile) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
          ),
          borderRadius: BorderRadius.circular(6)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(profile.image),
            radius: 50,
          ),
          SizedBox(
            height: 10,
          ),
          TextWidget(
            text: profile.name,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          TextWidget(
            text: profile.careerDescription,
            fontWeight: FontWeight.w400,
          )
        ],
      ),
    );
  }

  Container renderSearch() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[200],
          ),
          borderRadius: BorderRadius.circular(6)),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: 'Ex: Flutter',
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
        ),
      ),
    );
  }

  renderRoles(RxList<JobRole> roles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextWidget(
            color: Colors.grey[600],
            text: 'Cargos disponíveis',
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: roles.length,
            itemBuilder: (context, index) {
              JobRole role = roles[index];

              return Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey[200],
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextWidget(
                    text: role.title,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  renderJobs(RxList<Job> jobs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: TextWidget(
                color: Colors.grey[600],
                text: 'Trabalhos',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: TextWidget(
                  text: 'Ver todos',
                  color: Colors.grey[400],
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 180,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: jobs.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Job job = jobs[index];

              return InkWell(
                onTap: () {
                  goToPage(JobDetailView(job: job));
                },
                child: Container(
                  width: 300,
                  height: 200,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey[200],
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: job.image,
                                  placeholder: (context, url) => Center(
                                      child: LoaderWidget(
                                    size: 25,
                                    color: Colors.purple[900],
                                  )),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: job.title,
                                  fontWeight: FontWeight.w700,
                                ),
                                TextWidget(
                                  text: job.place,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[500],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: job.details,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.fade,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  renderSpecialists(Profile profile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextWidget(
            color: Colors.grey[600],
            text: 'Nossos especialistas',
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey[200],
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: profile.image,
                                  placeholder: (context, url) => Center(
                                      child: LoaderWidget(
                                    size: 25,
                                    color: Colors.purple[900],
                                  )),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text: profile.name,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: List.generate(
                          profile.skills.length,
                          (index) => Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey[200],
                                )),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              children: [
                                TextWidget(
                                  text: profile.skills[index].description,
                                  color: Colors.grey[500],
                                ),
                                TextWidget(
                                  text: profile.skills[index].level,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  renderAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.purple[900],
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.short_text,
          color: Colors.white,
          size: 35,
        ),
        onPressed: () => scaffoldKey.currentState.openDrawer(),
      ),
    );
  }
}
