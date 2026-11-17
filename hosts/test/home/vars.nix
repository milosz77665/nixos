rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  # Standalone Home Manager host: systemStateVersion is not required.
  homeStateVersion = "26.05";
  homeDirectory = "/home/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
