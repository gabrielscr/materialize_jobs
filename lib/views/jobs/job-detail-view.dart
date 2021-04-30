import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materialize_jobs/domain/job.dart';
import 'package:materialize_jobs/utils/pages.dart';
import 'package:materialize_jobs/utils/routes.dart';
import 'package:materialize_jobs/widgets/hex-color.dart';
import 'package:materialize_jobs/widgets/loader-widget.dart';
import 'package:materialize_jobs/widgets/text-widget.dart';

class JobDetailView extends StatelessWidget {
  final Job job;

  JobDetailView({Key key, @required this.job}) : super(key: key);

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
          text: 'DETALHE',
          fontWeight: FontWeight.w500,
          color: Colors.grey[700],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey[300],
                              )),
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: job.image,
                              placeholder: (context, url) => Center(
                                  child: LoaderWidget(
                                size: 25,
                                color: Colors.purple[900],
                              )),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: TextWidget(
                    text: job.title,
                    fontWeight: FontWeight.w600,
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: TextWidget(
                    text: job.place,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        job.tags.length,
                        (index) => Container(
                              padding: EdgeInsets.all(10),
                              child: Chip(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: Colors.grey[100],
                                  label: TextWidget(
                                    text: job.tags[index],
                                    color: Colors.purple[200],
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'O que você precisa',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(job.requirements.length, (index) {
                          var requirement = job.requirements[index];

                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextWidget(
                              text: '- ${requirement.item}',
                              color: Colors.grey[500],
                              fontSize: 13,
                            ),
                          );
                        }),
                      )
                    ],
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Descrição do projeto',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      TextWidget(
                        text: job.details,
                        color: Colors.grey[500],
                        fontSize: 13,
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.purple[900],
                  ),
                  onPressed: () {
                    Get.snackbar('', '',
                        snackStyle: SnackStyle.FLOATING,
                        titleText: TextWidget(
                          text: 'Sucesso!',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        messageText: TextWidget(
                          text: 'Obrigado por se candidatar, agora é só aguardar :)',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black);
                  },
                  child: TextWidget(
                    text: 'CANDIDATAR-SE AGORA',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
