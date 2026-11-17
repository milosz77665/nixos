rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  homeStateVersion = "25.11";
  systemStateVersion = "25.11";
  homeDirectory = "/home/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
