import 'dart:io';

void main() async {
  DataFetcher fetcher = DataFetcher();

  String data = await fetcher.getData();

  print(data);
}

class DataFetcher {
  Future<String> _getDataFromCloud() {
    sleep(Duration(seconds: 3));
    return Future.value("data from cloud");
  }

  String _parseDataFromCloud({required String cloudData}) {
    return "parsed Data";
  }

  Future<String> getData() async {
    String cloudDataRaw = await _getDataFromCloud();

    String parsedData = _parseDataFromCloud(cloudData: cloudDataRaw);

    return parsedData;
  }
}
