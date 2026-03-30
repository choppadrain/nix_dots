
{self,inputs,...}:{
flake.nixosModules.fonts = {
  pkgs,
  lib,
  # inputs,
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
	# inputs.apple-emoji.packages.${pkgs.system}.apple-emoji-ttf
       ];
    fontconfig = {
	  defaultFonts = {
  serif = [
    "New York Medium"
    "SFPro Display Medium"
    "SFPro Text Medium"
    "SFRounded Medium"
    "JetBrainsMono Nerd Font"
  ];
  sansSerif = [
    "SFPro Display Medium"
    "SFPro Text Medium"
    "SFRounded Medium"
    "JetBrainsMono Nerd Font"
  ];
  monospace = [
    "SFMono SemiBold nerd"
    "JetBrainsMono Nerd Font"
  ];
  emoji = [
    "Apple Color Emoji"
  ];
      };
      localConf = ''
<?xml version='1.0'?>
             <!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
             <fontconfig>
               <alias>
                 <family>"-apple-system"</family>
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

        <description>Enforce the grayscale antialiasing for correct rendering after stem-darkening</description>
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
