void main() {

  DataFetcher fetcher = DataFetcher();

  String data = fetcher.getData();

  print(data);
}

class DataFetcher {
  String _getDataFromCloud() {
    return "data from cloud";
  }

  String _parseDataFromCloud({required String cloudData}) {
    return "parsed Data";
  }

  String getData() {
    String cloudDataRaw = _getDataFromCloud();

    String parsedData = _parseDataFromCloud(cloudData: cloudDataRaw);

    return parsedData;
  }
}
