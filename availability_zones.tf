/*                  _ _       _     _ _ _ _           ______                     
     /\            (_) |     | |   (_) (_) |         |___  /                     
    /  \__   ____ _ _| | __ _| |__  _| |_| |_ _   _     / / ___  _ __   ___  ___ 
   / /\ \ \ / / _` | | |/ _` | '_ \| | | | __| | | |   / / / _ \| '_ \ / _ \/ __|
  / ____ \ V / (_| | | | (_| | |_) | | | | |_| |_| |  / /_| (_) | | | |  __/\__ \
 /_/    \_\_/ \__,_|_|_|\__,_|_.__/|_|_|_|\__|\__, | /_____\___/|_| |_|\___||___/
                                               __/ |                             
                                              |___/                            */

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones

data "aws_availability_zones" "available" {
  state = "available"
}