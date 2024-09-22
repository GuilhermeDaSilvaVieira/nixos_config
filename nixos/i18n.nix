{ ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8"; # Errors, Warnings, ETC ...
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEFONE = "pt_BR.UTF-8";
      LC_TIME = "en_IE.UTF-8"; # First day of the week is monday
    };
  };
}
