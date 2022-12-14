import 'package:app_find_job/core/constants/color_constants.dart';
import 'package:app_find_job/core/helpers/asset_helper.dart';
import 'package:app_find_job/models/jobinfor.dart';
import 'package:app_find_job/widgets/icon_text.dart';
import 'package:flutter/material.dart';

class JobItem extends StatelessWidget {
  final JobInformation jobInformation;
  final bool showTime;

  JobItem(this.jobInformation, {this.showTime = true});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(
          color: ColorPalette.primaryColor.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Image.asset(AssetHelper.logo),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    jobInformation.jobTitle,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(
                jobInformation.status == 1
                    ? Icons.bookmark
                    : Icons.bookmark_outline_outlined,
                color: jobInformation.status == 1
                    ? Theme.of(context).primaryColor
                    : Colors.black,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
            maxLines: 1,
            text: TextSpan(
              text: jobInformation.jobTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                  Icons.location_on_outlined, jobInformation.workingLocation),
              // if (showTime)
              //   IconText(Icons.access_time_outlined, jobInformation.jobType),
            ],
          )
        ],
      ),
    );
  }
}
