{ user, ... }:
{
  home.sessionVariables = {
  };
  home.sessionPath = [
    "/home/${user}/.cargo/bin"
  ];
}
