import 'package:appoinment_app_adv/core/features/home/data/models/specializations_response_model.dart';
import 'package:appoinment_app_adv/core/helpers/spacing.dart';
import 'package:appoinment_app_adv/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListViewItem extends StatelessWidget {
  final Doctors? doctorModel;
  const DoctorsListViewItem({super.key, this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                        doctorModel?.name??'Name',
                        style: TextStyles.font18DarkBlueBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5),
                      Text(
                        '${doctorModel?.degree}| ${doctorModel?.phone}',
                        style: TextStyles.font12greyMedium,
                      ),
                      verticalSpace(5),
                      Text(
                        doctorModel?.email??'Email',
                        style: TextStyles.font12greyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}