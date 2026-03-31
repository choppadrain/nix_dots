
{self, inputs, ...}:{
flake.nixosModules.fontsTest = {
  pkgs,
  lib,
  ...
}:
{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages =
      [
        inputs.apple-fonts.packages.${pkgs.system}.sf-mono-nerd
        inputs.apple-fonts.packages.${pkgs.system}.sf-pro-nerd
	inputs.apple-fonts.packages.${pkgs.system}.ny-nerd
       ];
    fontconfig = {
	  defaultFonts = {
  serif = [
    "NewYork Nerd Font"
    "SFProText Nerd Font"
  ];
  sansSerif = [
    "SFPro Display Font"
    "SFProText Nerd Font"
  ];
  monospace = [
    "SFMono Nerd Font Semibold"
    "JetBrainsMono Nerd Font"
  ];
      };
      localConf = ''
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>-apple-system</family>
    <prefer>
      <family>SFProText Nerd Font</family>
    </prefer>
  </alias>

  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>SFProText Nerd Font</family>
    </prefer>
  </alias>

  <alias>
    <family>sans</family>
    <prefer>
      <family>SFProText Nerd Font</family>
    </prefer>
  </alias>

  <match>
    <test name="family"><string>-apple-system</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>SFProText Nerd Font</string>
    </edit>
  </match>

  <match>
    <test name="family"><string>Arial</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>SFProText Nerd Font</string>
    </edit>
  </match>

  <match>
    <test name="family"><string>Helvetica</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>SFProText Nerd Font</string>
    </edit>
  </match>

  <match>
    <test name="family"><string>Verdana</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>SFProText Nerd Font</string>
    </edit>
  </match>

  <match>
    <test name="family"><string>Tahoma</string></test>
    <edit name="family" mode="assign" binding="strong">
      <string>SFProText Nerd Font</string>
    </edit>
  </match>

  <match target="font">
    <edit name="rgba" mode="assign"><const>none</const></edit>
    <edit name="antialias" mode="assign"><bool>true</bool></edit>
    <edit name="hinting" mode="assign"><bool>true</bool></edit>
    <edit name="lcdfilter" mode="assign"><const>lcdnone</const></edit>
  </match>

</fontconfig>

      '';
    };
  };
 };
}
