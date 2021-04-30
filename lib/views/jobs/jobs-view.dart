import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:materialize_jobs/controllers/job-controller.dart';
import 'package:materialize_jobs/domain/job.dart';
import 'package:materialize_jobs/utils/pages.dart';
import 'package:materialize_jobs/utils/routes.dart';
import 'package:materialize_jobs/widgets/hex-color.dart';
import 'package:materialize_jobs/widgets/loader-widget.dart';
import 'package:materialize_jobs/widgets/text-widget.dart';

import 'job-detail-view.dart';

class JobsView extends StatelessWidget {
  final bool showSearch;

  final JobController jobController = Get.find();

  JobsView({Key key, this.showSearch = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#707070')),
            onPressed: () => goToNamed(MaterializeJobsRoutes.home)),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextWidget(
          text: 'TODOS OS TRABALHOS',
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(15),
                child: Visibility(
                  visible: showSearch,
                  child: renderSearch(),
                )),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: renderJobs(jobController.jobs),
            ),
          ],
        ),
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

  renderJobs(RxList<Job> jobs) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
      shrinkWrap: true,
      itemCount: jobs.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        Job job = jobs[index];

        return InkWell(
          onTap: () {
            goToPage(JobDetailView(job: job));
          },
          child: Container(
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
    );
  }
}
