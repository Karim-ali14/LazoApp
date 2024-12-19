import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:lazo_provider/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_provider/Presentation/Widgets/CustomAppBar.dart';

class FileViewerScreen extends StatelessWidget {
  final String fileUrl;

  const FileViewerScreen({required this.fileUrl});

  @override
  Widget build(BuildContext context) {
    // Determine the file type based on the extension
    bool isImage = fileUrl.toLowerCase().endsWith('.jpg') ||
        fileUrl.toLowerCase().endsWith('.jpeg') ||
        fileUrl.toLowerCase().endsWith('.png') ||
        fileUrl.toLowerCase().endsWith('.webp') ||
        fileUrl.toLowerCase().endsWith('.svg') ||
        fileUrl.toLowerCase().endsWith('.gif');
    bool isPdf = fileUrl.toLowerCase().endsWith('.pdf');

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "",
        navigated: true,
      ),
      body: Center(
        child: isImage
            ? Image.network(
                fileUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: progress.expectedTotalBytes != null
                          ? progress.cumulativeBytesLoaded /
                              progress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Text("Failed to load image.");
                },
              )
            : isPdf
                ? PDFView(
                    filePath:
                        fileUrl, // For local files, you'd pass a file path
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: true,
                    pageFling: true,
                  )
                : const Text("Unsupported file format."),
      ),
    );
  }
}
