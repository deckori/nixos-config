{ config, ... }:
{
  time.timeZone = "Asia/Qatar";

  environment.sessionVariables.TZ = config.time.timeZone;
}
