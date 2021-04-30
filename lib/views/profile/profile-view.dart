import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:materialize_jobs/domain/profile.dart';
import 'package:materialize_jobs/utils/pages.dart';
import 'package:materialize_jobs/utils/routes.dart';
import 'package:materialize_jobs/widgets/hex-color.dart';
import 'package:materialize_jobs/widgets/loader-widget.dart';
import 'package:materialize_jobs/widgets/text-widget.dart';

class ProfileView extends StatelessWidget {
  final Profile profile;

  ProfileView({Key key, @required this.profile}) : super(key: key);

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
          text: 'PERFIL',
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
                              imageUrl: profile.image,
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
                    text: profile.name,
                    fontWeight: FontWeight.w600,
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: TextWidget(
                    text: profile.careerDescription,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  )),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Skills',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            profile.skills.length,
                            (index) => Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Chip(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          backgroundColor: Colors.grey[100],
                                          label: TextWidget(
                                            text: profile.skills[index].description,
                                            color: Colors.purple[900],
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    TextWidget(
                                      text: profile.skills[index].level,
                                      fontSize: 10,
                                      color: Colors.grey[400],
                                    )
                                  ],
                                )),
                      ),
                    ],
                  )),
                  Divider(
                    thickness: 0.5,
                  ),
                  Center(
                      child: TextWidget(
                    text: 'github.com/gabrielscr',
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  )),
                  Center(
                      child: TextWidget(
                    text: 'linkedin.com/in/gabrielscrocha',
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
