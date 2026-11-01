rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  stateVersion = "25.11";
  homeDirectory = "/Users/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
