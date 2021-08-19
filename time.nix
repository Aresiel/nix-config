{config, pkgs, ...}:
{
	time.timeZone = "Europe/Stockholm";
	services.chrony.enable = true;
	
}
