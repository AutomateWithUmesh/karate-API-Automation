function fn() {
  var env = karate.properties['karate.env'] || 'dev';
  var home = java.lang.System.getProperty('user.dir')
  var testDataFileName = karate.properties['testDataFileName']
  var testData = read('file:' + home + '/' + testDataFileName)
  var baseUrl = testData.apiURL
  var api_path = karate.read('classpath:utils/api_paths.json')
  var config = {
    baseUrl,
    env,
    path: api_path,
    setAuthToken: function () {
      const result = karate.callSingle('classpath:utils/auth.feature', { args: [testData.auth.username, testData.auth.password] });
      karate.configure('headers', { Authorization: result.authToken });
    },
  }
  return config;
}
