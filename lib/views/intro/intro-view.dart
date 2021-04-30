import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:materialize_jobs/controllers/intro-controller.dart';
import 'package:materialize_jobs/domain/intro.dart';
import 'package:materialize_jobs/widgets/gradient-button.dart';
import 'package:materialize_jobs/widgets/hex-color.dart';
import 'package:materialize_jobs/widgets/text-widget.dart';

class IntroView extends StatelessWidget {
  final IntroController introController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Obx(
          () => Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(child: renderItem(introController.intros[introController.indexSelected.value])),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: List.generate(
                                introController.intros.length,
                                (index) => renderIntroDot(
                                      index,
                                    )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GradientButton(
                      onPressed: () => introController.indexSelected.value == introController.maxIndex.value
                          ? introController.finish()
                          : introController.indexSelected.value++,
                      child: TextWidget(
                        text: introController.indexSelected.value == introController.maxIndex.value
                            ? 'PRONTO'
                            : 'PRÓXIMO',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      gradient: LinearGradient(
                        colors: <Color>[Colors.purple[700], Colors.purple[400]],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                        replacement: SizedBox(
                          height: 48,
                        ),
                        visible: introController.indexSelected.value >= 1,
                        child: TextButton(
                          onPressed: () => introController.indexSelected.value--,
                          child: TextWidget(
                            text: 'ANTERIOR',
                            fontSize: 14,
                            color: HexColor('#C1C1C1'),
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                  ],
                ),
              ],
            )),
          ),
        )));
  }

  renderIntroDot(index) {
    return InkWell(
      onTap: () => introController.indexSelected.value = index,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index == introController.indexSelected.value ? HexColor('#657283') : Colors.grey[400],
          ),
          height: 12,
          width: 12,
        ),
      ),
    );
  }

  renderItem(Intro intro) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: intro.image,
            placeholder: (context, url) => Center(child: SizedBox.shrink()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 50,
          ),
          Column(children: [
            TextWidget(
              text: intro.title,
              color: HexColor('#454141'),
              fontSize: 20,
            ),
            TextWidget(text: intro.description),
            SizedBox(
              height: 30,
            )
          ])
        ],
      ),
    );
  }
}
