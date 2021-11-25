part of '_widgets.dart';

class ImageNetworkProduct extends StatelessWidget {
  const ImageNetworkProduct({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
        url,
        fit: BoxFit.fitHeight,
        errorBuilder: (BuildContext context, Object exception,
            StackTrace? stackTrace) {
          return const Text('Error.');
        },
      
    );
  }
}
