import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../enums/kagi_colors.dart';

class ImageCubitWidget extends Cubit<int> {
  ImageCubitWidget(super.initialState);

  set state(int index) => emit(index);
}

class ImageSwitcher extends StatelessWidget {
  final List<String> imageUrls;

  const ImageSwitcher({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ImageCubitWidget(0),
        child:
            BlocBuilder<ImageCubitWidget, int>(builder: (context, blocIndex) {
          return Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrls[blocIndex], // Display the first image initially
                fit: BoxFit.cover,
              ),
            ),
            Container(height: 11),
            // Image Selector Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                      height: 12,
                      width: 12,
                      child: ElevatedButton(
                          onPressed: () =>
                              context.read<ImageCubitWidget>().state = index,
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(2),
                            shape: const CircleBorder(),
                            backgroundColor:
                                context.read<ImageCubitWidget>().state == index
                                    ? KagiColors.mediumGray.color
                                    : Colors.grey[300], // Button color
                          ),
                          child: Container())),
                ),
              ),
            ),
          ]);
        }));
  }
}
