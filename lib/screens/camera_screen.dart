import 'package:camera_app/db/functions/db_functions.dart';
import 'package:camera_app/db/model/db_model.dart';
import 'package:camera_app/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    getAllImage();
    super.initState();
  }

  late String _imageData;
  late int length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Camera App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              delete();
            },
            icon: const Icon(
              Icons.delete_outline,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: const Icon(
          Icons.camera_alt_outlined,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: galleryImageNotifier,
        builder: (
          BuildContext context,
          List<GallaryModel> galleryList,
          Widget? child,
        ) {
          length = galleryList.length;
          return (length == 0)
              ? const Center(
                  child: Text(
                    'No Photos ',
                  ),
                )
              : GridView.builder(
                  itemCount: galleryList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    final data = galleryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: ImageCard(
                        path: data.image,
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (image == null) {
      return;
    }
    _imageData = image.path;
    final picture = GallaryModel(
      image: _imageData,
    );
    addImage(picture);
  }

  Future<void> delete() async {
    deleteAllImage();
  }
}
