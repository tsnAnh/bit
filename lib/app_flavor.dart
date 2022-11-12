enum AppFlavor {
  staging('https://api.medium.com/'),
  production('https://api.medium.com/');

  final String baseUrl;
  // Flavor things...

  const AppFlavor(this.baseUrl);
}
