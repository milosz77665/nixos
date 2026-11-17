rec {
  user = {
    name = "name";
    fullName = "full name";
  };

  # Standalone Home Manager host: systemStateVersion is not required.
  homeStateVersion = "25.11";
  homeDirectory = "/Users/${user.name}";

  git = {
    username = "user name";
    email = "user@email.com";
  };
}
