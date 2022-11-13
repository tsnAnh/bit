enum AppFlavor {
  staging('https://api.medium.com/v1/'),
  production('https://api.medium.com/v1/');

  final String baseUrl;
  // Flavor things...

  const AppFlavor(this.baseUrl);
}
