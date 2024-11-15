import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kite_api/models/source.dart';
import 'package:kite_app/presentation/enums/kagi_colors.dart';

class SourceWidget extends StatelessWidget {
  final Source source;
  const SourceWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        padding: const EdgeInsets.symmetric(
            horizontal: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: KagiColors
                    .lightGray.color),
            borderRadius:
            BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/Globe 5.svg',
              colorFilter: ColorFilter.mode(KagiColors.blue.color, BlendMode.srcIn),
              height: 19,
            ),
            Container(
              width: 10,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 130),
                child: Text(
              source.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  color: KagiColors
                      .sourceBlue.color),
            ))
          ],
        ));
  }

}