import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<int> {
  ImageCubit(super.initialState);

  set state(int index) => emit(index);
}

class ImageSwitcher extends StatelessWidget {
  final List<String> imageUrls;

  const ImageSwitcher({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ImageCubit(0),
        child: BlocBuilder<ImageCubit, int>(
        builder: (context, blocIndex) {
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
                  child: ElevatedButton(
                    onPressed: () => context.read<ImageCubit>().state = index,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8.0),
                      backgroundColor: Colors.grey[300], // Button color
                    ),
                    child: const SizedBox(
                      width: 12,
                      height: 12,
                    ), // Empty button, you can add an icon if needed
                  ),
                ),
              ),
            ),
          ]);
        }));
  }

}