import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  child: Image.network(
                    'https://th.bing.com/th/id/R.4c5b993973882d96e67fe2fa0ce3a7d6?rik=5rsRJ%2bl6%2bzNqfQ&riu=http%3a%2f%2fdorukhospital.com%2fmedia%2fsection%2fdoruk_checkup_doctor.png&ehk=4MyaUBsRCmoSgGNOCjIPvsBs9n1kcart%2f7Io6LnPgwg%3d&risl=&pid=ImgRaw&r=0',
                    width: 110.w,
                    height: 120.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizntalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        'dgree| 059552522321',
                        style: TextStyles.font12greyMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        'Email',
                        style: TextStyles.font12greyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
