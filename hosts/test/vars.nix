rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  stateVersion = "25.11";
  homeDirectory = "/home/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
