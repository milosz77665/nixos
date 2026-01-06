rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  homeDirectory = "/home/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
