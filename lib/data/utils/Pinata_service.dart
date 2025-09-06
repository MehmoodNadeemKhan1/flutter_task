import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PinataService {
  final String jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mb3JtYXRpb24iOnsiaWQiOiI1NDk3ZmFhYy1jMjA4LTQzM2MtYjY2Mi1iNjBmMzhjOTNmMTQiLCJlbWFpbCI6IjIxMzE5MEBzdHVkZW50cy5hdS5lZHUucGsiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwicGluX3BvbGljeSI6eyJyZWdpb25zIjpbeyJkZXNpcmVkUmVwbGljYXRpb25Db3VudCI6MSwiaWQiOiJGUkExIn0seyJkZXNpcmVkUmVwbGljYXRpb25Db3VudCI6MSwiaWQiOiJOWUMxIn1dLCJ2ZXJzaW9uIjoxfSwibWZhX2VuYWJsZWQiOmZhbHNlLCJzdGF0dXMiOiJBQ1RJVkUifSwiYXV0aGVudGljYXRpb25UeXBlIjoic2NvcGVkS2V5Iiwic2NvcGVkS2V5S2V5IjoiOGUzZWQ3ZGQzNTQ2ZTNlODEzOGMiLCJzY29wZWRLZXlTZWNyZXQiOiIxYmExYzU1YjEwNDU1NzhiOGNjZGM5N2UwMmNlZmMxMmRiYTUxNzY4ODJjMDc4OWRlNzI0MmZlODJiZjgyZGJjIiwiZXhwIjoxNzg4NjkyNjM4fQ.gtxDIGekqVXbIPdkMo89DblDesJfcJODpUJ5kT5fMmM"; // apna JWT token yahan rakho
  final String url = "https://api.pinata.cloud/pinning/pinFileToIPFS";
  Future<String> uploadFile(File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    request.headers.addAll({
      "Authorization": "Bearer $jwt",
    });

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = await response.stream.bytesToString();
      var json = jsonDecode(body);
      return "https://gateway.pinata.cloud/ipfs/${json['IpfsHash']}";
    } else {
      throw Exception("Upload failed: ${response.statusCode}");
    }
  }

  Future<List<String>> uploadFiles(List<File> files) async {
    List<String> urls = [];
    for (var file in files) {
      final url = await uploadFile(file);
      urls.add(url);
    }
    return urls;
  }
}
